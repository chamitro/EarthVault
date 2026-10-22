-- EarthVault health check. Run in the Supabase SQL editor; paste the results back.
-- 1. Scheduled jobs (expect 5: capitals request/collect, extremes request/collect, plus any of your own)
select jobid, jobname, schedule, active from cron.job order by jobname;
-- 2. Last 24 runs of the jobs (status should be 'succeeded'; a 'failed' row shows the error in return_message)
select j.jobname, d.status, left(d.return_message, 120) as message, d.start_time
from cron.job_run_details d join cron.job j on j.jobid = d.jobid
where j.jobname like 'earthvault-%' and d.status <> 'succeeded' or (j.jobname = 'earthvault-capitals-request')
order by d.start_time desc limit 24;
-- 3. The answers Open-Meteo / USGS / GDACS sent back in the last 6 hours (status_code 200 = good; null = timeout, see error_msg)
select id, status_code, left(error_msg, 100) as error_msg, timed_out, left(content, 80) as content_start, created
from net._http_response order by id desc limit 12;
-- 4. Pending jobs (normally empty between rounds)
select * from public.cache_jobs order by created_at desc;
-- 5. The shared sheet's age
select key, updated_at, now() - updated_at as age, case when jsonb_typeof(data) = 'array' then jsonb_array_length(data)::text else left(data::text, 300) end as content from public.cache;
