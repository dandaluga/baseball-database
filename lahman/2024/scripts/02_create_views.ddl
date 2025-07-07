BEGIN TRANSACTION;

-- ====================================================================================================
-- batting_view: This view sums the player stats by year and league in the event a player 
--               has multiple stints across leagues (Ex: AL -> NL -> AL)
-- ====================================================================================================

-- DROP VIEW IF EXISTS year2024.batting_view;

CREATE VIEW year2024.batting_view AS (
  SELECT
      year_id,
      player_id,
      lg_id,
      sum(games) as games,
      sum(at_bats) as at_bats,
      sum(runs) as runs,
      sum(hits) as hits,
      sum(doubles) as doubles,
      sum(triples) as triples,
      sum(home_runs) as home_run,
      sum(runs_batted_in) as runs_batted_in,
      sum(stolen_bases) as stolen_bases,
      sum(caught_stealing) as caught_stealing,
      sum(walks) as walks,
      sum(strikeouts) as strikeouts,
      sum(intentional_walks) as intentional_walks,
      sum(hit_by_pitch) as hit_by_pitch,
      sum(sacrifice_hits) as sacrifice_hits,
      sum(sacrifice_flys) as sacfifice_flys,
      sum(ground_into_double_plays) as ground_into_double_plays
  FROM year2024.batting
  GROUP BY year_id, player_id, lg_id
);

-- ====================================================================================================
-- pitching_view: This view sums the player stats by year and league in the event a player
--                has multiple stints across leagues (Ex: AL -> NL -> AL)
--                Need to calulate era and baoop. You can't just use an average.
-- ====================================================================================================

-- DROP VIEW IF EXISTS year2024.pitching_view;

CREATE VIEW year2024.pitching_view AS (
  SELECT
      year_id,
      player_id,
      lg_id,
      sum(wins) as wins,
      sum(losses) as losses,
      sum(games) as games,
      sum(games_started) as games_started,
      sum(complete_games) as complete_games,
      sum(shut_outs) as shut_outs,
      sum(saves) as saves,
      sum(outs_pitched) as outs_pitched,
      sum(hits) as hits,
      sum(earned_runs) as earned_runs,
      sum(home_runs) as home_runs,
      sum(walks) as walks,
      sum(strikeouts) as strikeouts,
      sum(intentional_walks) as intentional_walks,
      9 * sum(earned_runs)/cast((sum(outs_pitched)/3.0) as double precision) as earned_run_average,
      sum(wild_pitches) as wild_pitches,
      sum(hit_by_pitch) as hit_by_pitch,
      sum(balks) as balks,
      sum(batters_faced) as batters_faced,
      sum(games_finished) as games_finished,
      sum(runs) as runs,
      sum(sacrifice_hits) as sacrifice_hits,
      sum(sacrifice_flys) as sacrifice_flys,
      sum(ground_into_double_plays) as ground_into_double_plays
  FROM year2024.pitching
  GROUP BY year_id, player_id, lg_id
);

END TRANSACTION;
