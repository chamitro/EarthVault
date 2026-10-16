-- EarthVault global leaderboard. Run once in the Supabase SQL Editor.
-- Visitors (anon key) may only insert a score and read the leaderboard view.

create table public.scores (
  id bigint generated always as identity primary key,
  game text not null check (game in ('quiz','hotornot','flags','mystery')),
  name text not null check (char_length(name) between 1 and 20),
  score integer not null check (score between 0 and 500),
  country text check (char_length(country) = 2),
  device text not null check (char_length(device) between 8 and 40),
  created_at timestamptz not null default now()
);
create index scores_top on public.scores (game, score desc, created_at);
create index scores_device on public.scores (device, created_at);
alter table public.scores enable row level security;

-- visitors may only insert; reading goes through the view below
create policy "insert scores" on public.scores for insert to anon with check (true);

-- best score per device and game, so one player cannot fill the top 5
create view public.leaderboard as
  select distinct on (game, device) game, name, score, country, created_at
  from public.scores
  order by game, device, score desc, created_at asc;
grant select on public.leaderboard to anon;

-- spam guard: one score per device every 20 seconds, 200 a day, clean names
create or replace function public.scores_guard() returns trigger
language plpgsql security definer set search_path = public as $$
begin
  if exists (select 1 from scores s where s.device = new.device
             and s.created_at > now() - interval '20 seconds') then
    raise exception 'too fast';
  end if;
  if (select count(*) from scores s where s.device = new.device
      and s.created_at > now() - interval '1 day') >= 200 then
    raise exception 'daily limit';
  end if;
  new.name := left(trim(regexp_replace(new.name, '[^[:alnum:] _.\-]', '', 'g')), 20);
  if new.name = '' then new.name := 'Explorer'; end if;
  return new;
end $$;
create trigger scores_guard before insert on public.scores
  for each row execute function public.scores_guard();
