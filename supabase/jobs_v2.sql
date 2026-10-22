-- EarthVault jobs, version 2. Run once in the Supabase SQL editor (after capitals_cache.sql and records.sql).
-- What changes:
--   * a public "status" row in public.cache records every round (ok / error, HTTP status, time), so a stalled job is visible
--     from outside: .../rest/v1/cache?key=eq.status
--   * the hourly rounds retry every 20 minutes while the data is older than 50 minutes (a failed hour no longer waits a full hour)
--   * Open-Meteo requests get 30 s instead of 20 s

create or replace function public.job_status(k text, v jsonb) returns void language plpgsql security definer set search_path = public as $$
begin
  insert into public.cache (key, data, updated_at) values ('status', jsonb_build_object(k, v || jsonb_build_object('at', now())), now())
  on conflict (key) do update set data = public.cache.data || jsonb_build_object(k, v || jsonb_build_object('at', now())), updated_at = now();
end $$;

-- 1. capitals: request two Open-Meteo answers, only when the sheet is older than 50 minutes and no round is in flight
create or replace function public.capitals_request() returns void language plpgsql security definer set search_path = public as $$
declare r record; age interval;
begin
  select now() - updated_at into age from public.cache where key = 'capitals';
  if age is not null and age < interval '50 minutes' then return; end if;
  if exists (select 1 from public.cache_jobs where key = 'capitals' and created_at > now() - interval '10 minutes') then return; end if;
  delete from public.cache_jobs where key = 'capitals';
  for r in
    select part, string_agg(lat::text, ',' order by ord) as lats, string_agg(lon::text, ',' order by ord) as lons
    from (select *, (ord - 1) / 104 as part from public.capitals) c group by part
  loop
    insert into public.cache_jobs (key, part, request_id)
    values ('capitals', r.part, net.http_get(
      'https://api.open-meteo.com/v1/forecast?latitude=' || r.lats || '&longitude=' || r.lons ||
      '&current=temperature_2m,apparent_temperature,weather_code,is_day,wind_speed_10m,relative_humidity_2m&timezone=auto',
      '{}'::jsonb, '{}'::jsonb, 30000));
  end loop;
  perform public.job_status('capitals_request', jsonb_build_object('ok', true));
end $$;

-- 2. capitals: fold the answers into the sheet; record the outcome
create or replace function public.capitals_collect() returns void language plpgsql security definer set search_path = public as $$
declare j record; st int; body text; err text; sheet jsonb := '[]'::jsonb; want int; got int := 0; failed boolean := false; why text := null;
begin
  select count(*) into want from public.cache_jobs where key = 'capitals';
  if want = 0 then return; end if;
  for j in select * from public.cache_jobs where key = 'capitals' order by part loop
    select status_code, content, error_msg into st, body, err from net._http_response where id = j.request_id;
    if st is distinct from 200 or body is null then
      if st is not null or err is not null then failed := true; why := coalesce(err, 'HTTP ' || st::text) || ' (part ' || j.part || ')'; end if;
      exit;
    end if;
    got := got + 1;
    sheet := sheet || coalesce((
      select jsonb_agg(jsonb_build_object(
        'city', c.city, 'country', c.country, 'iso2', c.iso2, 'region', c.region, 'lat', c.lat, 'lon', c.lon,
        't', (e.v->'current'->>'temperature_2m')::float, 'feel', (e.v->'current'->>'apparent_temperature')::float,
        'code', (e.v->'current'->>'weather_code')::int, 'day', (e.v->'current'->>'is_day')::int = 1,
        'wind', (e.v->'current'->>'wind_speed_10m')::float, 'hum', (e.v->'current'->>'relative_humidity_2m')::float,
        'tz', e.v->>'timezone', 'offset', coalesce((e.v->>'utc_offset_seconds')::int, 0)) order by c.ord)
      from jsonb_array_elements(case when jsonb_typeof(body::jsonb) = 'array' then body::jsonb else jsonb_build_array(body::jsonb) end) with ordinality as e(v, i)
      join public.capitals c on c.ord = j.part * 104 + e.i
      where e.v->'current'->>'temperature_2m' is not null), '[]'::jsonb);
  end loop;
  if got = want and jsonb_array_length(sheet) > 100 then
    insert into public.cache (key, data, updated_at) values ('capitals', sheet, now())
    on conflict (key) do update set data = excluded.data, updated_at = now();
    delete from public.cache_jobs where key = 'capitals';
    perform public.job_status('capitals', jsonb_build_object('ok', true, 'rows', jsonb_array_length(sheet)));
  elsif failed or exists (select 1 from public.cache_jobs where key = 'capitals' and created_at < now() - interval '10 minutes') then
    delete from public.cache_jobs where key = 'capitals';
    perform public.job_status('capitals', jsonb_build_object('ok', false, 'error', coalesce(why, 'no answer within 10 minutes')));
  end if;
exception when others then
  perform public.job_status('capitals', jsonb_build_object('ok', false, 'error', sqlerrm));
end $$;

-- 3. extremes: same guard (skip while the last USGS/GDACS round is under 50 minutes old)
create or replace function public.extremes_request() returns void language plpgsql security definer set search_path = public as $$
declare lastok timestamptz;
begin
  select (data->'quakes'->>'at')::timestamptz into lastok from public.cache where key = 'status' and (data->'quakes'->>'ok')::boolean;
  if lastok is not null and lastok > now() - interval '50 minutes' then return; end if;
  if exists (select 1 from public.cache_jobs where key in ('quakes', 'fires') and created_at > now() - interval '10 minutes') then return; end if;
  delete from public.cache_jobs where key in ('quakes', 'fires');
  insert into public.cache_jobs (key, part, request_id) values ('quakes', 0, net.http_get('https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_day.geojson', '{}'::jsonb, '{}'::jsonb, 30000));
  insert into public.cache_jobs (key, part, request_id) values ('fires', 0, net.http_get(
    'https://www.gdacs.org/gdacsapi/api/events/geteventlist/SEARCH?eventlist=WF&fromDate=' || to_char(now() - interval '7 days', 'YYYY-MM-DD') || '&toDate=' || to_char(now() + interval '1 day', 'YYYY-MM-DD') || '&alertlevel=Green;Orange;Red',
    '{}'::jsonb, '{}'::jsonb, 60000));
  perform public.job_status('extremes_request', jsonb_build_object('ok', true));
end $$;

create or replace function public.extremes_collect() returns void language plpgsql security definer set search_path = public as $$
declare
  sheet jsonb; j record; st int; body text; err text; today date := (now() at time zone 'utc')::date;
  hot jsonb; cold jsonb; windy jsonb; qn int; qmax jsonb; fn int; fbig jsonb; cur jsonb; touched boolean := false;
begin
  select data into sheet from public.cache where key = 'capitals' and updated_at > now() - interval '3 hours';
  if sheet is not null then
    select to_jsonb(x) into hot from (select e->>'city' as city, e->>'country' as country, e->>'iso2' as iso2, (e->>'t')::float as t from jsonb_array_elements(sheet) e where e->>'t' is not null order by (e->>'t')::float desc limit 1) x;
    select to_jsonb(x) into cold from (select e->>'city' as city, e->>'country' as country, e->>'iso2' as iso2, (e->>'t')::float as t from jsonb_array_elements(sheet) e where e->>'t' is not null order by (e->>'t')::float asc limit 1) x;
    select to_jsonb(x) into windy from (select e->>'city' as city, e->>'country' as country, e->>'iso2' as iso2, (e->>'wind')::float as wind from jsonb_array_elements(sheet) e where e->>'wind' is not null order by (e->>'wind')::float desc limit 1) x;
    touched := true;
  end if;
  for j in select * from public.cache_jobs where key = 'quakes' loop
    select status_code, content, error_msg into st, body, err from net._http_response where id = j.request_id;
    if st = 200 and body is not null then
      begin
        select count(*) into qn from jsonb_array_elements(body::jsonb->'features') f where (f->'properties'->>'mag')::float >= 4.5;
        select to_jsonb(x) into qmax from (select (f->'properties'->>'mag')::float as mag, f->'properties'->>'place' as place, f->'properties'->>'url' as url from jsonb_array_elements(body::jsonb->'features') f where f->'properties'->>'mag' is not null order by (f->'properties'->>'mag')::float desc limit 1) x;
        touched := true;
        perform public.job_status('quakes', jsonb_build_object('ok', true, 'count', qn));
      exception when others then perform public.job_status('quakes', jsonb_build_object('ok', false, 'error', 'parse: ' || sqlerrm)); end;
      delete from public.cache_jobs where id = j.id;
    elsif st is not null or err is not null or j.created_at < now() - interval '20 minutes' then
      perform public.job_status('quakes', jsonb_build_object('ok', false, 'error', coalesce(err, 'HTTP ' || st::text, 'no answer within 20 minutes')));
      delete from public.cache_jobs where id = j.id;
    end if;
  end loop;
  for j in select * from public.cache_jobs where key = 'fires' loop
    select status_code, content, error_msg into st, body, err from net._http_response where id = j.request_id;
    if st = 200 and body is not null then
      begin
        select count(*) into fn from jsonb_array_elements(body::jsonb->'features') f;
        select to_jsonb(x) into fbig from (select coalesce((f->'properties'->'severitydata'->>'severity')::float, 0) as ha, f->'properties'->>'name' as name, f->'properties'->>'country' as country from jsonb_array_elements(body::jsonb->'features') f order by 1 desc limit 1) x;
        touched := true;
        perform public.job_status('fires', jsonb_build_object('ok', true, 'count', fn));
      exception when others then perform public.job_status('fires', jsonb_build_object('ok', false, 'error', 'parse: ' || sqlerrm)); end;
      delete from public.cache_jobs where id = j.id;
    elsif st is not null or err is not null or j.created_at < now() - interval '20 minutes' then
      perform public.job_status('fires', jsonb_build_object('ok', false, 'error', coalesce(err, 'HTTP ' || st::text, 'no answer within 20 minutes')));
      delete from public.cache_jobs where id = j.id;
    end if;
  end loop;
  if not touched then return; end if;
  select data into cur from public.daily where day = today;
  cur := coalesce(cur, '{}'::jsonb);
  if hot is not null and (cur->'hot' is null or (hot->>'t')::float > (cur->'hot'->>'t')::float) then cur := cur || jsonb_build_object('hot', hot); end if;
  if cold is not null and (cur->'cold' is null or (cold->>'t')::float < (cur->'cold'->>'t')::float) then cur := cur || jsonb_build_object('cold', cold); end if;
  if windy is not null and (cur->'windy' is null or (windy->>'wind')::float > (cur->'windy'->>'wind')::float) then cur := cur || jsonb_build_object('windy', windy); end if;
  if qn is not null and (cur->>'quakes' is null or qn > (cur->>'quakes')::int) then cur := cur || jsonb_build_object('quakes', qn); end if;
  if qmax is not null and (cur->'maxQuake' is null or (qmax->>'mag')::float > (cur->'maxQuake'->>'mag')::float) then cur := cur || jsonb_build_object('maxQuake', qmax); end if;
  if fn is not null and (cur->>'fires' is null or fn > (cur->>'fires')::int) then cur := cur || jsonb_build_object('fires', fn); end if;
  if fbig is not null and (cur->'bigFire' is null or (fbig->>'ha')::float > (cur->'bigFire'->>'ha')::float) then cur := cur || jsonb_build_object('bigFire', fbig); end if;
  insert into public.daily (day, data, updated_at) values (today, cur, now()) on conflict (day) do update set data = excluded.data, updated_at = now();
  perform public.record_try('hot', (hot->>'t')::float, true, hot);
  perform public.record_try('cold', (cold->>'t')::float, false, cold);
  perform public.record_try('wind', (windy->>'wind')::float, true, windy);
  perform public.record_try('quake', (qmax->>'mag')::float, true, qmax);
  perform public.record_try('quakes_day', (cur->>'quakes')::float, true, jsonb_build_object('day', today));
  perform public.record_try('fire', case when (fbig->>'ha')::float > 0 then (fbig->>'ha')::float end, true, fbig);
  perform public.record_try('fires_day', (cur->>'fires')::float, true, jsonb_build_object('day', today));
exception when others then
  perform public.job_status('extremes_collect', jsonb_build_object('ok', false, 'error', sqlerrm));
end $$;

-- 4. schedules: requests every 20 minutes (they do nothing while the data is fresh), collectors every minute
select cron.unschedule(jobid) from cron.job where jobname in ('earthvault-capitals-request', 'earthvault-capitals-collect', 'earthvault-extremes-request', 'earthvault-extremes-collect');
select cron.schedule('earthvault-capitals-request', '*/20 * * * *', $$select public.capitals_request()$$);
select cron.schedule('earthvault-capitals-collect', '* * * * *', $$select public.capitals_collect()$$);
select cron.schedule('earthvault-extremes-request', '5,25,45 * * * *', $$select public.extremes_request()$$);
select cron.schedule('earthvault-extremes-collect', '* * * * *', $$select public.extremes_collect()$$);

-- 5. one round now (the sheet and the status row appear within about two minutes)
select public.capitals_request();
select public.extremes_request();
