-- EarthVault: let the Time Machine game post its streaks to the leaderboard. Run once in the Supabase SQL editor.
alter table public.scores drop constraint if exists scores_game_check;
alter table public.scores add constraint scores_game_check check (game in ('quiz','hotornot','flags','mystery','factfiction','history'));
