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
