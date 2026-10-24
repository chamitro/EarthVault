-- EarthVault housekeeping. Run once in the Supabase SQL editor.
-- pg_cron keeps a log row for every job run (our jobs run about 2,900 times a day) and never deletes it.
-- This trims the log to the last 7 days, once a day, so it stays at a few thousand rows instead of a million a year.
select cron.unschedule(jobid) from cron.job where jobname = 'earthvault-trim-cron-log';
select cron.schedule('earthvault-trim-cron-log', '30 3 * * *', $$delete from cron.job_run_details where end_time < now() - interval '7 days'$$);

-- Current sizes, for your information (run this part any time)
select 'scores' as what, count(*) as rows, pg_size_pretty(pg_total_relation_size('public.scores')) as size from public.scores
union all select 'cron log', count(*), pg_size_pretty(pg_total_relation_size('cron.job_run_details')) from cron.job_run_details
union all select 'daily', count(*), pg_size_pretty(pg_total_relation_size('public.daily')) from public.daily
union all select 'records_log', count(*), pg_size_pretty(pg_total_relation_size('public.records_log')) from public.records_log
union all select 'whole database', null, pg_size_pretty(pg_database_size(current_database()));

-- Safety net for the leaderboard, agreed 2026-10-24: every 1 January, if the scores table is above 100 MB,
-- delete rounds older than one year that are not in the top 100 of their game. At today's size it does nothing.
create or replace function public.scores_prune() returns void language plpgsql security definer set search_path = public as $$
declare n bigint;
begin
  if pg_total_relation_size('public.scores') < 100 * 1024 * 1024 then return; end if;
  with keep as (
    select id from (select id, row_number() over (partition by game order by score desc, created_at asc) as rn from public.scores) r where rn <= 100
  )
  delete from public.scores s where s.created_at < now() - interval '1 year' and s.id not in (select id from keep);
  get diagnostics n = row_count;
  raise notice 'scores_prune removed % rows', n;
end $$;
select cron.unschedule(jobid) from cron.job where jobname = 'earthvault-scores-prune';
select cron.schedule('earthvault-scores-prune', '15 4 1 1 *', $$select public.scores_prune()$$);
