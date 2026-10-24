-- EarthVault: who has played. Run one query at a time in the Supabase SQL editor (it shows only the last result).

-- 1. Every player: rounds, first and last play, games tried
select name, count(*) as rounds, min(created_at)::date as first_played, max(created_at)::date as last_played,
       string_agg(distinct game, ', ') as games, max(country) as country
from public.scores
group by name
order by last_played desc, rounds desc;

-- 2. Best score per player per game
select game, name, max(score) as best, count(*) as rounds
from public.scores
group by game, name
order by game, best desc;

-- 3. Rounds and players per day, last two weeks
select created_at::date as day, count(*) as rounds, count(distinct name) as players
from public.scores
where created_at > now() - interval '14 days'
group by day order by day desc;
