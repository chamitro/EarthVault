-- EarthVault: planet records, the daily log behind "Year in review", and the Fact or Fiction leaderboard.
-- Run once in the Supabase SQL editor, AFTER capitals_cache.sql (it reuses the capitals sheet and the cache_jobs table).

-- 1. Fact or Fiction can post scores
alter table public.scores drop constraint if exists scores_game_check;
alter table public.scores add constraint scores_game_check check (game in ('quiz','hotornot','flags','mystery','factfiction'));

-- 2. Tables (public read, written only by the jobs)
create table if not exists public.records (
  key text primary key,
  value double precision not null,
  detail jsonb not null default '{}'::jsonb,
  set_at timestamptz not null default now()
);
create table if not exists public.records_log (
  id bigserial primary key,
  key text not null,
  value double precision not null,
  detail jsonb not null default '{}'::jsonb,
  set_at timestamptz not null default now()
);
create table if not exists public.daily (
  day date primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.records enable row level security;
alter table public.records_log enable row level security;
alter table public.daily enable row level security;
drop policy if exists "records public read" on public.records;
create policy "records public read" on public.records for select to anon, authenticated using (true);
drop policy if exists "records_log public read" on public.records_log;
create policy "records_log public read" on public.records_log for select to anon, authenticated using (true);
drop policy if exists "daily public read" on public.daily;
create policy "daily public read" on public.daily for select to anon, authenticated using (true);

-- 3. A record falls when a value beats the stored one (higher or lower, per key)
create or replace function public.record_try(k text, v double precision, higher boolean, det jsonb) returns void language plpgsql security definer set search_path = public as $$
declare cur double precision;
begin
  if v is null then return; end if;
  select value into cur from public.records where key = k;
  if cur is null then
    insert into public.records (key, value, detail, set_at) values (k, v, coalesce(det, '{}'::jsonb), now());
    insert into public.records_log (key, value, detail) values (k, v, coalesce(det, '{}'::jsonb));
  elsif (higher and v > cur) or (not higher and v < cur) then
    update public.records set value = v, detail = coalesce(det, '{}'::jsonb), set_at = now() where key = k;
    insert into public.records_log (key, value, detail) values (k, v, coalesce(det, '{}'::jsonb));
  end if;
end $$;

-- 4. Hourly: ask USGS and GDACS (the capitals sheet is already in public.cache)
create or replace function public.extremes_request() returns void language plpgsql security definer set search_path = public as $$
begin
  delete from public.cache_jobs where key in ('quakes', 'fires');
  insert into public.cache_jobs (key, part, request_id) values ('quakes', 0, net.http_get('https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_day.geojson', '{}'::jsonb, '{}'::jsonb, 20000));
  insert into public.cache_jobs (key, part, request_id) values ('fires', 0, net.http_get(
    'https://www.gdacs.org/gdacsapi/api/events/geteventlist/SEARCH?eventlist=WF&fromDate=' || to_char(now() - interval '7 days', 'YYYY-MM-DD') || '&toDate=' || to_char(now() + interval '1 day', 'YYYY-MM-DD') || '&alertlevel=Green;Orange;Red',
    '{}'::jsonb, '{}'::jsonb, 60000)); -- GDACS can take half a minute
end $$;

-- 5. Every minute: fold whatever has arrived into today's row and the all-time records
create or replace function public.extremes_collect() returns void language plpgsql security definer set search_path = public as $$
declare
  sheet jsonb; j record; st int; body text; today date := (now() at time zone 'utc')::date;
  hot jsonb; cold jsonb; windy jsonb; qn int; qmax jsonb; fn int; fbig jsonb; cur jsonb; touched boolean := false;
begin
  -- capitals: hottest, coldest, windiest right now (sheet refreshed hourly by capitals_collect)
  select data into sheet from public.cache where key = 'capitals' and updated_at > now() - interval '3 hours';
  if sheet is not null then
    select to_jsonb(x) into hot from (select e->>'city' as city, e->>'country' as country, e->>'iso2' as iso2, (e->>'t')::float as t from jsonb_array_elements(sheet) e where e->>'t' is not null order by (e->>'t')::float desc limit 1) x;
    select to_jsonb(x) into cold from (select e->>'city' as city, e->>'country' as country, e->>'iso2' as iso2, (e->>'t')::float as t from jsonb_array_elements(sheet) e where e->>'t' is not null order by (e->>'t')::float asc limit 1) x;
    select to_jsonb(x) into windy from (select e->>'city' as city, e->>'country' as country, e->>'iso2' as iso2, (e->>'wind')::float as wind from jsonb_array_elements(sheet) e where e->>'wind' is not null order by (e->>'wind')::float desc limit 1) x;
    touched := true;
  end if;
  -- earthquakes of the last 24 hours (USGS)
  for j in select * from public.cache_jobs where key = 'quakes' loop
    select status_code, content into st, body from net._http_response where id = j.request_id;
    if st = 200 and body is not null then
      begin
        select count(*) into qn from jsonb_array_elements(body::jsonb->'features') f where (f->'properties'->>'mag')::float >= 4.5;
        select to_jsonb(x) into qmax from (select (f->'properties'->>'mag')::float as mag, f->'properties'->>'place' as place, f->'properties'->>'url' as url from jsonb_array_elements(body::jsonb->'features') f where f->'properties'->>'mag' is not null order by (f->'properties'->>'mag')::float desc limit 1) x;
        touched := true;
      exception when others then raise warning 'quakes parse: %', sqlerrm; end;
      delete from public.cache_jobs where id = j.id;
    elsif j.created_at < now() - interval '20 minutes' then
      delete from public.cache_jobs where id = j.id;
    end if;
  end loop;
  -- active wildfires (GDACS)
  for j in select * from public.cache_jobs where key = 'fires' loop
    select status_code, content into st, body from net._http_response where id = j.request_id;
    if st = 200 and body is not null then
      begin
        select count(*) into fn from jsonb_array_elements(body::jsonb->'features') f;
        select to_jsonb(x) into fbig from (select coalesce((f->'properties'->'severitydata'->>'severity')::float, 0) as ha, f->'properties'->>'name' as name, f->'properties'->>'country' as country from jsonb_array_elements(body::jsonb->'features') f order by 1 desc limit 1) x;
        touched := true;
      exception when others then raise warning 'fires parse: %', sqlerrm; end;
      delete from public.cache_jobs where id = j.id;
    elsif j.created_at < now() - interval '20 minutes' then
      delete from public.cache_jobs where id = j.id;
    end if;
  end loop;
  if not touched then return; end if;
  -- today's row keeps the extremes of the day
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
  -- all-time records
  perform public.record_try('hot', (hot->>'t')::float, true, hot);
  perform public.record_try('cold', (cold->>'t')::float, false, cold);
  perform public.record_try('wind', (windy->>'wind')::float, true, windy);
  perform public.record_try('quake', (qmax->>'mag')::float, true, qmax);
  perform public.record_try('quakes_day', (cur->>'quakes')::float, true, jsonb_build_object('day', today));
  perform public.record_try('fire', case when (fbig->>'ha')::float > 0 then (fbig->>'ha')::float end, true, fbig);
  perform public.record_try('fires_day', (cur->>'fires')::float, true, jsonb_build_object('day', today));
exception when others then
  raise warning 'extremes_collect: %', sqlerrm;
end $$;

select cron.unschedule(jobid) from cron.job where jobname in ('earthvault-extremes-request', 'earthvault-extremes-collect');
select cron.schedule('earthvault-extremes-request', '5 * * * *', $$select public.extremes_request()$$);
select cron.schedule('earthvault-extremes-collect', '* * * * *', $$select public.extremes_collect()$$);

-- first round right away (records and today's row appear within about two minutes)
select public.extremes_request();
