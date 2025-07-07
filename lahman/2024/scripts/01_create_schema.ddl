BEGIN TRANSACTION; 

CREATE SCHEMA IF NOT EXISTS year2024 AUTHORIZATION mlbapi;

-- ====================================================================================================
-- drop any view since they are tied back to tables
-- ====================================================================================================
DROP VIEW IF EXISTS year2024.batting_view;
DROP VIEW IF EXISTS year2024.pitching_view;

-- ====================================================================================================
-- allstar_full
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.allstar_full;
CREATE TABLE IF NOT EXISTS year2024.allstar_full (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    player_id varchar(10) NOT NULL,
    year_id int NOT NULL,
    game_num int NOT NULL,
    game_id varchar(12) DEFAULT NULL,
    team_id varchar(3) DEFAULT NULL,
    lg_id varchar(2) DEFAULT NULL,
    played_in_game int DEFAULT NULL,
    starting_pos int DEFAULT NULL
);

-- This unique index fails due to duplicates.
-- CREATE UNIQUE INDEX ui_allstar_full_1  
--  ON year2024.allstar_full(player_id,year_id,gameNum,game_id,lg_id);  

-- ====================================================================================================
-- appearances
-- ====================================================================================================
DROP TABLE IF EXISTS year2024.appearances;
CREATE TABLE IF NOT EXISTS year2024.appearances (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    year_id int NOT NULL,
    team_id varchar(3) NOT NULL,
    lg_id varchar(2) DEFAULT NULL,
    player_id varchar(10) NOT NULL,
    games_all int DEFAULT NULL,
    games_started int DEFAULT NULL,
    games_batting int DEFAULT NULL,
    games_defense int DEFAULT NULL,
    games_p int DEFAULT NULL,
    games_c int DEFAULT NULL,
    games_1b int DEFAULT NULL,
    games_2b int DEFAULT NULL,
    games_3b int DEFAULT NULL,
    games_ss int DEFAULT NULL,
    games_lf int DEFAULT NULL,
    games_cf int DEFAULT NULL,
    games_rf int DEFAULT NULL,
    games_of int DEFAULT NULL,
    games_dh int DEFAULT NULL,
    games_ph int DEFAULT NULL,
    games_pr int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_appearances_1  
    ON year2024.appearances(year_id,team_id,player_id);  

-- ====================================================================================================
-- awards_managers
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.awards_managers;
CREATE TABLE IF NOT EXISTS year2024.awards_managers (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    player_id varchar(10) NOT NULL,
    award_id varchar(25) NOT NULL,
    year_id int NOT NULL,
    lg_id varchar(2) NOT NULL,
    tie varchar(1) DEFAULT NULL,
    notes varchar(100) DEFAULT NULL
);

CREATE UNIQUE INDEX ui_awards_managers_1  
    ON year2024.awards_managers(year_id,award_id,lg_id,player_id); 

-- ====================================================================================================
-- awards_players
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.awards_players;
CREATE TABLE IF NOT EXISTS year2024.awards_players (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    player_id varchar(10) NOT NULL,
    award_id varchar(255) NOT NULL,
    year_id int NOT NULL,
    lg_id varchar(2),            /* Made NULLABLE due to missing data. */
    tie varchar(1) DEFAULT NULL,
    notes varchar(100) DEFAULT NULL
);

-- Commented out for now due to duplicate rows.
-- CREATE UNIQUE INDEX ui_awards_players_1  
--  ON year2024.awards_players(year_id,award_id,lg_id,player_id); 

-- ====================================================================================================
-- awards_share_managers
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.awards_share_managers;
CREATE TABLE IF NOT EXISTS year2024.awards_share_managers (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    player_id varchar(10) NOT NULL,
    award_id varchar(255) NOT NULL,
    year_id int NOT NULL,
    lg_id varchar(2),   /* Alloowing null since there are rows with null. */
    tie varchar(1) DEFAULT NULL,
    notes varchar(100) DEFAULT NULL
);

-- This unique index fails due to duplicates.
-- CREATE UNIQUE INDEX ui_awards_players_1  
--  ON year2024.awards_share_managers(year_id,award_id,lg_id,player_id); 

-- ====================================================================================================
-- awards_share_managers
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.awards_share_managers;
CREATE TABLE IF NOT EXISTS year2024.awards_share_managers (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    award_id varchar(25) NOT NULL,
    year_id int NOT NULL,
    lg_id varchar(2) NOT NULL,
    player_id varchar(10) NOT NULL,
    points_won int DEFAULT NULL,
    points_max int DEFAULT NULL,
    votes_first int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_awards_share_managers_1  
    ON year2024.awards_share_managers(award_id,year_id,lg_id,player_id); 

-- ====================================================================================================
-- awards_share_players
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.awards_share_players;
CREATE TABLE IF NOT EXISTS year2024.awards_share_players (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    award_id varchar(25) NOT NULL,
    year_id int NOT NULL,
    lg_id varchar(2) NOT NULL,
    player_id varchar(10) NOT NULL,
    points_won double precision DEFAULT NULL,
    points_max int DEFAULT NULL,
    votes_first double precision DEFAULT NULL
);

CREATE UNIQUE INDEX ui_awards_share_players_1  
    ON year2024.awards_share_players(award_id,year_id,lg_id,player_id); 

-- ====================================================================================================
-- batting
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.batting;
CREATE TABLE IF NOT EXISTS year2024.batting (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    player_id varchar(10) NOT NULL,
    year_id int NOT NULL,
    stint int NOT NULL,
    team_id varchar(3) DEFAULT NULL,
    lg_id varchar(2) DEFAULT NULL,
    games int DEFAULT NULL,
    games_batting int DEFAULT NULL,
    at_bats int DEFAULT NULL,
    runs int DEFAULT NULL,
    hits int DEFAULT NULL,
    doubles int DEFAULT NULL,
    triples int DEFAULT NULL,
    home_runs int DEFAULT NULL,
    runs_batted_in int DEFAULT NULL,
    stolen_bases int DEFAULT NULL,
    caught_stealing int DEFAULT NULL,
    walks int DEFAULT NULL,
    strikeouts int DEFAULT NULL,
    intentional_walks int DEFAULT NULL,
    hit_by_pitch int DEFAULT NULL,
    sacrifice_hits int DEFAULT NULL,
    sacrifice_flys int DEFAULT NULL,
    ground_into_double_plays int DEFAULT NULL,
    games_old int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_batting_1  
    ON year2024.batting(player_id,year_id,stint); 

-- ====================================================================================================
-- batting_post
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.batting_post;
CREATE TABLE IF NOT EXISTS year2024.batting_post (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    year_id int NOT NULL,
    round varchar(10) NOT NULL,
    player_id varchar(10) NOT NULL,
    team_id varchar(3) DEFAULT NULL,
    lg_id varchar(2) DEFAULT NULL,
    games int DEFAULT NULL,
    at_bats int DEFAULT NULL,
    runs int DEFAULT NULL,
    hits int DEFAULT NULL,
    doubles int DEFAULT NULL,
    triples int DEFAULT NULL,
    home_runs int DEFAULT NULL,
    runs_batted_in int DEFAULT NULL,
    stolen_bases int DEFAULT NULL,
    caught_stealing int DEFAULT NULL,
    walks int DEFAULT NULL,
    strikeouts int DEFAULT NULL,
    intentional_walks int DEFAULT NULL,
    hit_by_pitch int DEFAULT NULL,
    sacrifice_hits int DEFAULT NULL,
    sacrifice_flys int DEFAULT NULL,
    ground_into_double_plays int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_batting_post_1  
    ON year2024.batting_post(year_id,round,player_id); 

-- ====================================================================================================
-- college_playing
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.college_playing;
CREATE TABLE IF NOT EXISTS year2024.college_playing (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    player_id varchar(10) NOT NULL,
    school_id varchar(15) NOT NULL,
    year_id int NOT NULL
);

CREATE UNIQUE INDEX ui_college_playing_1  
    ON year2024.college_playing(player_id, school_id, year_id); 

-- ====================================================================================================
-- fielding
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.fielding;
CREATE TABLE IF NOT EXISTS year2024.fielding (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    player_id varchar(10) NOT NULL,
    year_id int NOT NULL,
    stint int NOT NULL,
    team_id varchar(3) DEFAULT NULL,
    lg_id varchar(2) DEFAULT NULL,
    position varchar(2) NOT NULL,
    games int DEFAULT NULL,
    games_started int DEFAULT NULL,
    inning_outs int DEFAULT NULL,
    put_outs int DEFAULT NULL,
    assists int DEFAULT NULL,
    errors int DEFAULT NULL,
    double_plays int DEFAULT NULL,
    passed_balls int DEFAULT NULL,
    wild_pitches int DEFAULT NULL,
    stolen_bases int DEFAULT NULL,
    caught_stealing int DEFAULT NULL,
    zone_rating double precision DEFAULT NULL
);

CREATE UNIQUE INDEX ui_fielding_1  
    ON year2024.fielding(player_id,year_id,stint,position); 

-- ====================================================================================================
-- fielding_of
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.fielding_of;
CREATE TABLE IF NOT EXISTS year2024.fielding_of (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    player_id varchar(10) NOT NULL,
    year_id int NOT NULL,
    stint int NOT NULL,
    games_played_left_field int DEFAULT NULL,
    games_played_center_field int DEFAULT NULL,
    games_played_right_field int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_fielding_of_1  
    ON year2024.fielding_of(player_id,year_id,stint); 

-- ====================================================================================================
-- fielding_of_split
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.fielding_of_split;
CREATE TABLE IF NOT EXISTS year2024.fielding_of_split (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    player_id varchar(10) NOT NULL,
    year_id int NOT NULL,
    stint int NOT NULL,
    team_id varchar(3) DEFAULT NULL,
    lg_id varchar(2) DEFAULT NULL,
    position varchar(2) NOT NULL,
    games int DEFAULT NULL,
    games_started int DEFAULT NULL,
    inning_outs int DEFAULT NULL,
    put_outs int DEFAULT NULL,
    assists int DEFAULT NULL,
    errors int DEFAULT NULL,
    double_plays int DEFAULT NULL,
    passed_balls int DEFAULT NULL,
    wild_pitches int DEFAULT NULL,
    stolen_bases int DEFAULT NULL,
    caught_stealing int DEFAULT NULL,
    zone_rating double precision DEFAULT NULL
);

CREATE UNIQUE INDEX ui_fielding_of_split_1  
    ON year2024.fielding_of_split(player_id,year_id,stint,position); 

-- ====================================================================================================
-- fielding_post
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.fielding_post;
CREATE TABLE IF NOT EXISTS year2024.fielding_post (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    player_id varchar(10) NOT NULL,
    year_id int NOT NULL,
    team_id varchar(3) DEFAULT NULL,
    lg_id varchar(2) DEFAULT NULL,
    round varchar(10) NOT NULL,
    position varchar(2) NOT NULL,
    games int DEFAULT NULL,
    games_started int DEFAULT NULL,
    inning_outs int DEFAULT NULL,
    put_outs int DEFAULT NULL,
    assists int DEFAULT NULL,
    errors int DEFAULT NULL,
    double_plays int DEFAULT NULL,
    triple_plays int DEFAULT NULL,
    passed_balls int DEFAULT NULL,
    stolen_bases int DEFAULT NULL,
    caught_stealing int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_fielding_post_1  
    ON year2024.fielding_post(player_id,year_id,round,position); 

-- ====================================================================================================
-- hall_of_fame
-- ====================================================================================================

-- Looks like those voted thru the veterans committe have NA rather than empty (which will default to NULL).
-- As a result, I changed the data rather than change the data type.

DROP TABLE IF EXISTS year2024.hall_of_fame;
CREATE TABLE IF NOT EXISTS year2024.hall_of_fame (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    player_id varchar(10) NOT NULL,
    year_id int NOT NULL,
    voted_by varchar(64) NOT NULL DEFAULT '',
    ballots int DEFAULT NULL,    /* Update data from ,NA,NA,NA to ,,, */
    needed int DEFAULT NULL,     /* Update data from ,NA,NA,NA to ,,, */
    votes int DEFAULT NULL,      /* Update data from ,NA,NA,NA to ,,, */
    inducted varchar(1) DEFAULT NULL,
    category varchar(20) DEFAULT NULL,
    needed_note varchar(200) DEFAULT NULL
);

CREATE UNIQUE INDEX ui_hall_of_fame_1  
    ON year2024.hall_of_fame(player_id,year_id,voted_by); 

-- ====================================================================================================
-- home_games
-- ====================================================================================================

-- The columns defined in the csv file have periods for some of the columns. Hence, changed the header
-- row to: year,league,team,park,span_first,span_last,games,openings,attendance

DROP TABLE IF EXISTS year2024.home_games;
CREATE TABLE IF NOT EXISTS year2024.home_games (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    year_id int NOT NULL,
    league varchar(64) NULL DEFAULT '',
    team varchar(10) DEFAULT NULL,
    park varchar(10) DEFAULT NULL,
    span_first date DEFAULT NULL,
    span_last date DEFAULT NULL,
    games int DEFAULT NULL,
    openings int DEFAULT NULL,
    attendance int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_home_games_1  
    ON year2024.home_games(year_id,league,team,park); 

-- ====================================================================================================
-- managers
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.managers;
CREATE TABLE IF NOT EXISTS year2024.managers (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    player_id varchar(10) DEFAULT NULL,
    year_id int NOT NULL,
    team_id varchar(3) NOT NULL,
    lg_id varchar(2) DEFAULT NULL,
    in_season int NOT NULL,
    games int DEFAULT NULL,
    wins int DEFAULT NULL,
    losses int DEFAULT NULL,
    rank int DEFAULT NULL,
    player_manager varchar(1) DEFAULT NULL
);

CREATE UNIQUE INDEX ui_managers_1  
    ON year2024.managers(year_id,team_id,in_season); 

-- ====================================================================================================
-- managers_half
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.managers_half;
CREATE TABLE IF NOT EXISTS year2024.managers_half (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    player_id varchar(10) NOT NULL,
    year_id int NOT NULL,
    team_id varchar(3) NOT NULL,
    lg_id varchar(2) DEFAULT NULL,
    in_season int DEFAULT NULL,
    half int NOT NULL,
    games int DEFAULT NULL,
    wins int DEFAULT NULL,
    losses int DEFAULT NULL,
    rank int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_managers_half_1  
    ON year2024.managers_half(year_id,team_id,player_id,half); 

-- ====================================================================================================
-- parks
-- ====================================================================================================

-- The columns defined year2024.in the csv file have periods for some of the columns. Hence, changed the header
-- row to: park,park_name,park_alias,city,state,country

DROP TABLE IF EXISTS year2024.parks;
CREATE TABLE IF NOT EXISTS year2024.parks (
    park_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    id int NOT NULL,
    park_alias varchar(100) DEFAULT NULL,
    park_key varchar(50) NOT NULL,
    park_name varchar(100) DEFAULT NULL,
    city varchar(50) DEFAULT NULL,
    state varchar(50) DEFAULT NULL,
    country varchar(50) DEFAULT NULL
);

CREATE UNIQUE INDEX ui_parks_1  
    ON year2024.parks(park_id); 

-- ====================================================================================================
-- people
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.people;
CREATE TABLE IF NOT EXISTS year2024.people (
    people_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    id int NOT NULL,
    player_id varchar(10) DEFAULT NULL,
    birth_year int DEFAULT NULL,
    birth_month int DEFAULT NULL,
    birth_day int DEFAULT NULL,
    birth_city varchar(50) DEFAULT NULL,
    birth_country varchar(50) DEFAULT NULL,
    birth_state varchar(50) DEFAULT NULL,
    death_year int DEFAULT NULL,
    death_month int DEFAULT NULL,
    death_day int DEFAULT NULL,
    death_country varchar(50) DEFAULT NULL,
    death_state varchar(50) DEFAULT NULL,
    death_city varchar(50) DEFAULT NULL,
    name_first varchar(50) DEFAULT NULL,
    name_last varchar(50) DEFAULT NULL,
    name_given varchar(255) DEFAULT NULL,
    weight int DEFAULT NULL,
    height double precision DEFAULT NULL,
    bats varchar(1) DEFAULT NULL,
    throws varchar(1) DEFAULT NULL,
    debut varchar(10) DEFAULT NULL,
    bbref_id varchar(9) DEFAULT NULL,
    final_game varchar(10) DEFAULT NULL,
    retro_id varchar(9) DEFAULT NULL
);

CREATE UNIQUE INDEX ui_people_1  
    ON year2024.people(player_id); 

-- ====================================================================================================
-- pitching
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.pitching;
CREATE TABLE IF NOT EXISTS year2024.pitching (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    player_id varchar(10) NOT NULL,
    year_id int NOT NULL,
    stint int NOT NULL,
    team_id varchar(3) DEFAULT NULL,
    lg_id varchar(2) DEFAULT NULL,
    wins int DEFAULT NULL,
    losses int DEFAULT NULL,
    games int DEFAULT NULL,
    games_started int DEFAULT NULL,
    complete_games int DEFAULT NULL,
    shut_outs int DEFAULT NULL,
    saves int DEFAULT NULL,
    outs_pitched int DEFAULT NULL,
    hits int DEFAULT NULL,
    earned_runs int DEFAULT NULL,
    home_runs int DEFAULT NULL,
    walks int DEFAULT NULL,
    strikeouts int DEFAULT NULL,
    opponent_batting_average double precision DEFAULT NULL,
    earned_run_average double precision DEFAULT NULL,
    intentional_walks int DEFAULT NULL,
    wild_pitches int DEFAULT NULL,
    hit_by_pitch int DEFAULT NULL,
    balks int DEFAULT NULL,
    batters_faced int DEFAULT NULL,
    games_finished int DEFAULT NULL,
    runs int DEFAULT NULL,
    sacrifice_hits int DEFAULT NULL,
    sacrifice_flys int DEFAULT NULL,
    ground_into_double_plays int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_pitching_1  
    ON year2024.pitching(player_id,year_id,stint); 

-- ====================================================================================================
-- pitching_post
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.pitching_post;
CREATE TABLE IF NOT EXISTS year2024.pitching_post (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    player_id varchar(10) NOT NULL,
    year_id int NOT NULL,
    round varchar(10) NOT NULL,
    team_id varchar(3) DEFAULT NULL,
    lg_id varchar(2) DEFAULT NULL,
    wins int DEFAULT NULL,
    losses int DEFAULT NULL,
    games int DEFAULT NULL,
    games_started int DEFAULT NULL,
    complete_games int DEFAULT NULL,
    shut_outs int DEFAULT NULL,
    saves int DEFAULT NULL,
    outs_pitched int DEFAULT NULL,
    hits int DEFAULT NULL,
    earned_runs int DEFAULT NULL,
    home_runs int DEFAULT NULL,
    walks int DEFAULT NULL,
    strikeouts int DEFAULT NULL,
    opponent_batting_average double precision DEFAULT NULL,
    earned_run_average double precision DEFAULT NULL,
    intentional_walks int DEFAULT NULL,
    wild_pitches int DEFAULT NULL,
    hit_by_pitch int DEFAULT NULL,
    balks int DEFAULT NULL,
    batters_faced int DEFAULT NULL,
    games_finished int DEFAULT NULL,
    runs int DEFAULT NULL,
    sacrifice_hits int DEFAULT NULL,
    sacrifice_flys int DEFAULT NULL,
    ground_into_double_plays int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_pitching_post_1  
    ON year2024.pitching_post(player_id,year_id,round); 

-- ====================================================================================================
-- salaries
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.salaries;
CREATE TABLE IF NOT EXISTS year2024.salaries (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    year_id int NOT NULL,
    team_id varchar(3) NOT NULL,
    lg_id varchar(2) NOT NULL,
    player_id varchar(10) NOT NULL,
    salary double precision DEFAULT NULL
);

CREATE UNIQUE INDEX ui_salaries_1  
    ON year2024.salaries(year_id,team_id,lg_id,player_id); 

-- ====================================================================================================
-- schools
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.schools;
CREATE TABLE IF NOT EXISTS year2024.schools (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    school_id varchar(15) NOT NULL,
    name_full varchar(255) DEFAULT NULL,
    city varchar(55) DEFAULT NULL,
    state varchar(55) DEFAULT NULL,
    country varchar(55) DEFAULT NULL
);

CREATE UNIQUE INDEX ui_schools_1  
    ON year2024.schools(school_id); 

-- ====================================================================================================
-- series_post
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.series_post;
CREATE TABLE IF NOT EXISTS year2024.series_post (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    year_id int NOT NULL,
    round varchar(5) NOT NULL,
    team_id_winner varchar(3) DEFAULT NULL,
    lg_id_winner varchar(2) DEFAULT NULL,
    team_id_loser varchar(3) DEFAULT NULL,
    lg_id_loser varchar(2) DEFAULT NULL,
    wins int DEFAULT NULL,
    losses int DEFAULT NULL,
    ties int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_series_post_1  
    ON year2024.series_post(year_id,round); 

-- ====================================================================================================
-- teams
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.teams;
CREATE TABLE IF NOT EXISTS year2024.teams (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    year_id int NOT NULL,
    lg_id varchar(2) NOT NULL,
    team_id varchar(3) NOT NULL,
    franch_id varchar(3) DEFAULT NULL,
    div_id varchar(1) DEFAULT NULL,
    rank int DEFAULT NULL,
    games int DEFAULT NULL,
    games_home int DEFAULT NULL,
    wins int DEFAULT NULL,
    losses int DEFAULT NULL,
    division_winner varchar(1) DEFAULT NULL,
    wild_card_winner varchar(1) DEFAULT NULL,
    league_winner varchar(1) DEFAULT NULL,
    world_series_winner varchar(1) DEFAULT NULL,
    runs int DEFAULT NULL,
    at_bats int DEFAULT NULL,
    hits int DEFAULT NULL,
    doubles int DEFAULT NULL,
    triples int DEFAULT NULL,
    home_runs int DEFAULT NULL,
    walks int DEFAULT NULL,
    strikeouts int DEFAULT NULL,
    stolen_bases int DEFAULT NULL,
    caught_stealing int DEFAULT NULL,
    hit_by_pitch int DEFAULT NULL,
    sacrifice_flys int DEFAULT NULL,
    opponent_run_scored int DEFAULT NULL,
    earned_runs int DEFAULT NULL,
    earned_run_average double precision DEFAULT NULL,
    complete_games int DEFAULT NULL,
    shut_outs int DEFAULT NULL,
    saves int DEFAULT NULL,
    outs_pitched int DEFAULT NULL,
    hits_allowed int DEFAULT NULL,
    home_runs_allowed int DEFAULT NULL,
    walks_allowed int DEFAULT NULL,
    strikeouts_allowed int DEFAULT NULL,
    errors int DEFAULT NULL,
    double_plays int DEFAULT NULL,
    fielding_percentage double precision DEFAULT NULL,
    name varchar(50) DEFAULT NULL,
    park varchar(255) DEFAULT NULL,
    attendance int DEFAULT NULL,
    batters_park_factor int DEFAULT NULL,
    pitchers_park_factor int DEFAULT NULL,
    team_id_baseball_reference varchar(3) DEFAULT NULL,
    team_id_lahman45 varchar(3) DEFAULT NULL,
    team_id_retrosheet varchar(3) DEFAULT NULL
);

CREATE UNIQUE INDEX ui_teams_1  
    ON year2024.teams(year_id,lg_id,team_id); 

-- ====================================================================================================
-- teams_franchises
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.teams_franchises;
CREATE TABLE IF NOT EXISTS year2024.teams_franchises (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    franch_id varchar(3) NOT NULL,
    franch_name varchar(50) DEFAULT NULL,
    active varchar(2) DEFAULT NULL,
    national_association_id varchar(3) DEFAULT NULL
);

CREATE UNIQUE INDEX ui_teams_franchises_1  
    ON year2024.teams_franchises(franch_id); 

-- ====================================================================================================
-- teams_half
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.teams_half;
CREATE TABLE IF NOT EXISTS year2024.teams_half (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    year_id int NOT NULL,
    lg_id varchar(2) NOT NULL,
    team_id varchar(3) NOT NULL,
    half varchar(1) NOT NULL,
    div_id varchar(1) DEFAULT NULL,
    division_winner varchar(1) DEFAULT NULL,
    rank int DEFAULT NULL,
    games int DEFAULT NULL,
    wins int DEFAULT NULL,
    losses int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_teams_half_1  
    ON year2024.teams_half(year_id,team_id,lg_id,half); 

END TRANSACTION;
