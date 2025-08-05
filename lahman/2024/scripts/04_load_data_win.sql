BEGIN TRANSACTION;

COPY year2024.allstar_full(player_id,year_id,game_num,game_id,team_id,lg_id,played_in_game,starting_pos)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\AllstarFull.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.appearances(year_id,team_id,lg_id,player_id,games_all,games_started,games_batting,games_defense,games_p,games_c,games_1b,games_2b,games_3b,games_ss,games_lf,games_cf,games_rf,games_of,games_dh,games_ph,games_pr)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\Appearances.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.awards_managers(player_id,award_id,year_id,lg_id,tie,notes)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\AwardsManagers.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');;

COPY year2024.awards_players(player_id,award_id,year_id,lg_id,tie,notes)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\AwardsPlayers.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.awards_share_managers(award_id,year_id,lg_id,player_id,points_won,points_max,votes_first)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\AwardsShareManagers.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.awards_share_players(award_id,year_id,lg_id,player_id,points_won,points_max,votes_first)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\AwardsSharePlayers.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.batting(player_id,year_id,stint,team_id,lg_id,games,games_batting,at_bats,runs,hits,doubles,triples,home_runs,runs_batted_in,stolen_bases,caught_stealing,walks,strikeouts,intentional_walks,hit_by_pitch,sacrifice_hits,sacrifice_flys,ground_into_double_plays,games_old)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\Batting.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.batting_post(year_id,round,player_id,team_id,lg_id,games,at_bats,runs,hits,doubles,triples,home_runs,runs_batted_in,stolen_bases,caught_stealing,walks,strikeouts,intentional_walks,hit_by_pitch,sacrifice_hits,sacrifice_flys,ground_into_double_plays)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\BattingPost.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.college_playing(player_id,school_id,year_id)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\CollegePlaying.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.fielding(player_id,year_id,stint,team_id,lg_id,position,games,games_started,inning_outs,put_outs,assists,errors,double_plays,passed_balls,wild_pitches,stolen_bases,caught_stealing,zone_rating)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\Fielding.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.fielding_of(player_id,year_id,stint,games_played_left_field,games_played_center_field,games_played_right_field)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\FieldingOF.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.fielding_of_split(player_id,year_id,stint,team_id,lg_id,position,games,games_started,inning_outs,put_outs,assists,errors,double_plays,passed_balls,wild_pitches,stolen_bases,caught_stealing,zone_rating)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\FieldingOFsplit.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.fielding_post(player_id,year_id,team_id,lg_id,round,position,games,games_started,inning_outs,put_outs,assists,errors,double_plays,triple_plays,passed_balls,stolen_bases,caught_stealing)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\FieldingPost.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.hall_of_fame(player_id,year_id,voted_by,ballots,needed,votes,inducted,category,needed_note)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\HallOfFame.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.home_games(year_id,league,team,park,span_first,span_last,games,openings,attendance)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\HomeGames.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.managers(player_id,year_id,team_id,lg_id,in_season,games,wins,losses,rank,player_manager)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\Managers.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.managers_half(player_id,year_id,team_id,lg_id,in_season,half,games,wins,losses,rank)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\ManagersHalf.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.parks(id,park_alias,park_key,park_name,city,state,country)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\Parks.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.people(id,player_id,birth_year,birth_month,birth_day,birth_city,birth_country,birth_state,death_year,death_month,death_day,death_country,death_state,death_city,name_first,name_last,name_given,weight,height,bats,throws,debut,bbref_id,final_game,retro_id)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\People.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.pitching(player_id,year_id,stint,team_id,lg_id,wins,losses,games,games_started,complete_games,shut_outs,saves,outs_pitched,hits,earned_runs,home_runs,walks,strikeouts,opponent_batting_average,earned_run_average,intentional_walks,wild_pitches,hit_by_pitch,balks,batters_faced,games_finished,runs,sacrifice_hits,sacrifice_flys,ground_into_double_plays)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\Pitching.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.pitching_post(player_id,year_id,round,team_id,lg_id,wins,losses,games,games_started,complete_games,shut_outs,saves,outs_pitched,hits,earned_runs,home_runs,walks,strikeouts,opponent_batting_average,earned_run_average,intentional_walks,wild_pitches,hit_by_pitch,balks,batters_faced,games_finished,runs,sacrifice_hits,sacrifice_flys,ground_into_double_plays)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\PitchingPost.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.salaries(year_id,team_id,lg_id,player_id,salary)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\Salaries.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.schools(school_id,name_full,city,state,country)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\Schools.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.series_post(year_id,round,team_id_winner,lg_id_winner,team_id_loser,lg_id_loser,wins,losses,ties)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\SeriesPost.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.teams(year_id,lg_id,team_id,franch_id,div_id,rank,games,games_home,wins,losses,division_winner,wild_card_winner,league_winner,world_series_winner,runs,at_bats,hits,doubles,triples,home_runs,walks,strikeouts,stolen_bases,caught_stealing,hit_by_pitch,sacrifice_flys,opponent_run_scored,earned_runs,earned_run_average,complete_games,shut_outs,saves,outs_pitched,hits_allowed,home_runs_allowed,walks_allowed,strikeouts_allowed,errors,double_plays,fielding_percentage,name,park,attendance,batters_park_factor,pitchers_park_factor,team_id_baseball_reference,team_id_lahman45,team_id_retrosheet)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\Teams.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.teams_franchises(franch_id,franch_name,active,national_association_id)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\TeamsFranchises.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

COPY year2024.teams_half(year_id,lg_id,team_id,half,div_id,division_winner,rank,games,wins,losses)
FROM 'C:\dev\baseball\baseball-database\lahman\2024\data\TeamsHalf.csv' 
WITH (FORMAT csv, ENCODING 'UTF8', HEADER true, DELIMITER ',');

END TRANSACTION;