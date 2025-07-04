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
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
playerID varchar(10) NOT NULL,
yearID int NOT NULL,
gameNum int NOT NULL,
gameID varchar(12) DEFAULT NULL,
teamID varchar(3) DEFAULT NULL,
lgID varchar(2) DEFAULT NULL,
GP int DEFAULT NULL,
startingPos int DEFAULT NULL
);

-- This unique index fails due to duplicates.
-- CREATE UNIQUE INDEX ui_allstar_full_1  
-- ON year2024.allstar_full(playerID,yearID,gameNum,gameID,lgID);  

-- ====================================================================================================
-- appearances
-- ====================================================================================================
DROP TABLE IF EXISTS year2024.appearances;
CREATE TABLE IF NOT EXISTS year2024.appearances (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
yearID int NOT NULL,
teamID varchar(3) NOT NULL,
lgID varchar(2) DEFAULT NULL,
playerID varchar(10) NOT NULL,
G_all int DEFAULT NULL,
GS int DEFAULT NULL,
G_batting int DEFAULT NULL,
G_defense int DEFAULT NULL,
G_p int DEFAULT NULL,
G_c int DEFAULT NULL,
G_1b int DEFAULT NULL,
G_2b int DEFAULT NULL,
G_3b int DEFAULT NULL,
G_ss int DEFAULT NULL,
G_lf int DEFAULT NULL,
G_cf int DEFAULT NULL,
G_rf int DEFAULT NULL,
G_of int DEFAULT NULL,
G_dh int DEFAULT NULL,
G_ph int DEFAULT NULL,
G_pr int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_appearances_1  
ON year2024.appearances(yearID,teamID,playerID);  

-- ====================================================================================================
-- awards_managers
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.awards_managers;
CREATE TABLE IF NOT EXISTS year2024.awards_managers (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
playerID varchar(10) NOT NULL,
awardID varchar(25) NOT NULL,
yearID int NOT NULL,
lgID varchar(2) NOT NULL,
tie varchar(1) DEFAULT NULL,
notes varchar(100) DEFAULT NULL
);

CREATE UNIQUE INDEX ui_awards_managers_1  
ON year2024.awards_managers(yearID,awardID,lgID,playerID); 

-- ====================================================================================================
-- awards_players
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.awards_players;
CREATE TABLE IF NOT EXISTS year2024.awards_players (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
playerID varchar(10) NOT NULL,
awardID varchar(255) NOT NULL,
yearID int NOT NULL,
lgID varchar(2),            /* Made NULLABLE due to missing data. */
tie varchar(1) DEFAULT NULL,
notes varchar(100) DEFAULT NULL
);

-- Commented out for now due to duplicate rows.
-- CREATE UNIQUE INDEX ui_awards_players_1  
-- ON year2024.awards_players(yearID,awardID,lgID,playerID); 

-- ====================================================================================================
-- awards_share_managers
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.awards_share_managers;
CREATE TABLE IF NOT EXISTS year2024.awards_share_managers (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
playerID varchar(10) NOT NULL,
awardID varchar(255) NOT NULL,
yearID int NOT NULL,
lgID varchar(2),   /* Alloowing null since there are rows with null. */
tie varchar(1) DEFAULT NULL,
notes varchar(100) DEFAULT NULL
);

-- This unique index fails due to duplicates.
-- CREATE UNIQUE INDEX ui_awards_players_1  
-- ON year2024.awards_share_managers(yearID,awardID,lgID,playerID); 

-- ====================================================================================================
-- awards_share_managers
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.awards_share_managers;
CREATE TABLE IF NOT EXISTS year2024.awards_share_managers (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
awardID varchar(25) NOT NULL,
yearID int NOT NULL,
lgID varchar(2) NOT NULL,
playerID varchar(10) NOT NULL,
pointsWon int DEFAULT NULL,
pointsMax int DEFAULT NULL,
votesFirst int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_awards_share_managers_1  
ON year2024.awards_share_managers(awardID,yearID,lgID,playerID); 

-- ====================================================================================================
-- awards_share_players
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.awards_share_players;
CREATE TABLE IF NOT EXISTS year2024.awards_share_players (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
awardID varchar(25) NOT NULL,
yearID int NOT NULL,
lgID varchar(2) NOT NULL,
playerID varchar(10) NOT NULL,
pointsWon double precision DEFAULT NULL,
pointsMax int DEFAULT NULL,
votesFirst double precision DEFAULT NULL
);

CREATE UNIQUE INDEX ui_awards_share_players_1  
ON year2024.awards_share_players(awardID,yearID,lgID,playerID); 

-- ====================================================================================================
-- batting
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.batting;
CREATE TABLE IF NOT EXISTS year2024.batting (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
playerID varchar(10) NOT NULL,
yearID int NOT NULL,
stint int NOT NULL,
teamID varchar(3) DEFAULT NULL,
lgID varchar(2) DEFAULT NULL,
G int DEFAULT NULL,
G_batting int DEFAULT NULL,
AB int DEFAULT NULL,
R int DEFAULT NULL,
H int DEFAULT NULL,
H2B int DEFAULT NULL,
H3B int DEFAULT NULL,
HR int DEFAULT NULL,
RBI int DEFAULT NULL,
SB int DEFAULT NULL,
CS int DEFAULT NULL,
BB int DEFAULT NULL,
SO int DEFAULT NULL,
IBB int DEFAULT NULL,
HBP int DEFAULT NULL,
SH int DEFAULT NULL,
SF int DEFAULT NULL,
GIDP int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_batting_1  
ON year2024.batting(playerID,yearID,stint); 

-- ====================================================================================================
-- batting_post
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.batting_post;
CREATE TABLE IF NOT EXISTS year2024.batting_post (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
yearID int NOT NULL,
round varchar(10) NOT NULL,
playerID varchar(10) NOT NULL,
teamID varchar(3) DEFAULT NULL,
lgID varchar(2) DEFAULT NULL,
G int DEFAULT NULL,
AB int DEFAULT NULL,
R int DEFAULT NULL,
H int DEFAULT NULL,
H2B int DEFAULT NULL,
H3B int DEFAULT NULL,
HR int DEFAULT NULL,
RBI int DEFAULT NULL,
SB int DEFAULT NULL,
CS int DEFAULT NULL,
BB int DEFAULT NULL,
SO int DEFAULT NULL,
IBB int DEFAULT NULL,
HBP int DEFAULT NULL,
SH int DEFAULT NULL,
SF int DEFAULT NULL,
GIDP int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_batting_post_1  
ON year2024.batting_post(yearID,round,playerID); 

-- ====================================================================================================
-- college_playing
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.college_playing;
CREATE TABLE IF NOT EXISTS year2024.college_playing (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
playerID varchar(10) NOT NULL,
schoolID varchar(15) NOT NULL,
yearID int NOT NULL
);

CREATE UNIQUE INDEX ui_college_playing_1  
ON year2024.college_playing(playerID, schoolID, yearID); 

-- ====================================================================================================
-- fielding
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.fielding;
CREATE TABLE IF NOT EXISTS year2024.fielding (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
playerID varchar(10) NOT NULL,
yearID int NOT NULL,
stint int NOT NULL,
teamID varchar(3) DEFAULT NULL,
lgID varchar(2) DEFAULT NULL,
POS varchar(2) NOT NULL,
G int DEFAULT NULL,
GS int DEFAULT NULL,
InnOuts int DEFAULT NULL,
PO int DEFAULT NULL,
A int DEFAULT NULL,
E int DEFAULT NULL,
DP int DEFAULT NULL,
PB int DEFAULT NULL,
WP int DEFAULT NULL,
SB int DEFAULT NULL,
CS int DEFAULT NULL,
ZR double precision DEFAULT NULL
);

CREATE UNIQUE INDEX ui_fielding_1  
ON year2024.fielding(playerID,yearID,stint,POS); 

-- ====================================================================================================
-- fielding_of
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.fielding_of;
CREATE TABLE IF NOT EXISTS year2024.fielding_of (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
playerID varchar(10) NOT NULL,
yearID int NOT NULL,
stint int NOT NULL,
Glf int DEFAULT NULL,
Gcf int DEFAULT NULL,
Grf int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_fielding_of_1  
ON year2024.fielding_of(playerID,yearID,stint); 

-- ====================================================================================================
-- fielding_of_split
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.fielding_of_split;
CREATE TABLE IF NOT EXISTS year2024.fielding_of_split (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
playerID varchar(10) NOT NULL,
yearID int NOT NULL,
stint int NOT NULL,
teamID varchar(3) DEFAULT NULL,
lgID varchar(2) DEFAULT NULL,
POS varchar(2) NOT NULL,
G int DEFAULT NULL,
GS int DEFAULT NULL,
InnOuts int DEFAULT NULL,
PO int DEFAULT NULL,
A int DEFAULT NULL,
E int DEFAULT NULL,
DP int DEFAULT NULL,
PB int DEFAULT NULL,
WP int DEFAULT NULL,
SB int DEFAULT NULL,
CS int DEFAULT NULL,
ZR double precision DEFAULT NULL
);

CREATE UNIQUE INDEX ui_fielding_of_split_1  
ON year2024.fielding_of_split(playerID,yearID,stint,POS); 

-- ====================================================================================================
-- fielding_post
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.fielding_post;
CREATE TABLE IF NOT EXISTS year2024.fielding_post (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
playerID varchar(10) NOT NULL,
yearID int NOT NULL,
teamID varchar(3) DEFAULT NULL,
lgID varchar(2) DEFAULT NULL,
round varchar(10) NOT NULL,
POS varchar(2) NOT NULL,
G int DEFAULT NULL,
GS int DEFAULT NULL,
InnOuts int DEFAULT NULL,
PO int DEFAULT NULL,
A int DEFAULT NULL,
E int DEFAULT NULL,
DP int DEFAULT NULL,
TP int DEFAULT NULL,
PB int DEFAULT NULL,
SB int DEFAULT NULL,
CS int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_fielding_post_1  
ON year2024.fielding_post(playerID,yearID,round,POS); 

-- ====================================================================================================
-- hall_of_fame
-- ====================================================================================================

-- Looks like those voted thru the veterans committe have NA rather than empty (which will default to NULL).
-- As a result, I changed the data rather than change the data type.

DROP TABLE IF EXISTS year2024.hall_of_fame;
CREATE TABLE IF NOT EXISTS year2024.hall_of_fame (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
playerID varchar(10) NOT NULL,
yearid int NOT NULL,
votedBy varchar(64) NOT NULL DEFAULT '',
ballots int DEFAULT NULL,    /* Update data from ,NA,NA,NA to ,,, */
needed int DEFAULT NULL,     /* Update data from ,NA,NA,NA to ,,, */
votes int DEFAULT NULL,      /* Update data from ,NA,NA,NA to ,,, */
inducted varchar(1) DEFAULT NULL,
category varchar(20) DEFAULT NULL,
needed_note varchar(200) DEFAULT NULL
);

CREATE UNIQUE INDEX ui_hall_of_fame_1  
ON year2024.hall_of_fame(playerID,yearid,votedBy); 

-- ====================================================================================================
-- home_games
-- ====================================================================================================

-- The columns defined in the csv file have periods for some of the columns. Hence, changed the header
-- row to: year,league,team,park,span_first,span_last,games,openings,attendance

DROP TABLE IF EXISTS year2024.home_games;
CREATE TABLE IF NOT EXISTS year2024.home_games (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
year int NOT NULL,
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
ON year2024.home_games(year,league,team,park); 

-- ====================================================================================================
-- managers
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.managers;
CREATE TABLE IF NOT EXISTS year2024.managers (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
playerID varchar(10) DEFAULT NULL,
yearID int NOT NULL,
teamID varchar(3) NOT NULL,
lgID varchar(2) DEFAULT NULL,
inseason int NOT NULL,
G int DEFAULT NULL,
W int DEFAULT NULL,
L int DEFAULT NULL,
rank int DEFAULT NULL,
plyrMgr varchar(1) DEFAULT NULL
);

CREATE UNIQUE INDEX ui_managers_1  
ON year2024.managers(yearID,teamID,inseason); 

-- ====================================================================================================
-- managers_half
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.managers_half;
CREATE TABLE IF NOT EXISTS year2024.managers_half (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
playerID varchar(10) NOT NULL,
yearID int NOT NULL,
teamID varchar(3) NOT NULL,
lgID varchar(2) DEFAULT NULL,
inseason int DEFAULT NULL,
half int NOT NULL,
G int DEFAULT NULL,
W int DEFAULT NULL,
L int DEFAULT NULL,
rank int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_managers_half_1  
ON year2024.managers_half(yearID,teamID,playerID,half); 

-- ====================================================================================================
-- parks
-- ====================================================================================================

-- The columns defined year2024.in the csv file have periods for some of the columns. Hence, changed the header
-- row to: park,park_name,park_alias,city,state,country

DROP TABLE IF EXISTS year2024.parks;
CREATE TABLE IF NOT EXISTS year2024.parks (
PARK_ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
ID int NOT NULL,
parkalias varchar(100) DEFAULT NULL,
parkkey varchar(50) NOT NULL,
parkname varchar(100) DEFAULT NULL,
city varchar(50) DEFAULT NULL,
state varchar(50) DEFAULT NULL,
country varchar(50) DEFAULT NULL
);

CREATE UNIQUE INDEX ui_parks_1  
ON year2024.parks(ID); 

-- ====================================================================================================
-- people
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.people;
CREATE TABLE IF NOT EXISTS year2024.people (
PEOPLE_ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
ID int NOT NULL,
playerID varchar(10) DEFAULT NULL,
birthYear int DEFAULT NULL,
birthMonth int DEFAULT NULL,
birthDay int DEFAULT NULL,
birthCity varchar(50) DEFAULT NULL,
birthCountry varchar(50) DEFAULT NULL,
birthState varchar(50) DEFAULT NULL,
deathYear int DEFAULT NULL,
deathMonth int DEFAULT NULL,
deathDay int DEFAULT NULL,
deathCountry varchar(50) DEFAULT NULL,
deathState varchar(50) DEFAULT NULL,
deathCity varchar(50) DEFAULT NULL,
nameFirst varchar(50) DEFAULT NULL,
nameLast varchar(50) DEFAULT NULL,
nameGiven varchar(255) DEFAULT NULL,
weight int DEFAULT NULL,
height double precision DEFAULT NULL,
bats varchar(1) DEFAULT NULL,
throws varchar(1) DEFAULT NULL,
debut varchar(10) DEFAULT NULL,
bbrefID varchar(9) DEFAULT NULL,
finalGame varchar(10) DEFAULT NULL,
retroID varchar(9) DEFAULT NULL
);

CREATE UNIQUE INDEX ui_people_1  
ON year2024.people(playerID); 

-- ====================================================================================================
-- pitching
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.pitching;
CREATE TABLE IF NOT EXISTS year2024.pitching (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
playerID varchar(10) NOT NULL,
yearID int NOT NULL,
stint int NOT NULL,
teamID varchar(3) DEFAULT NULL,
lgID varchar(2) DEFAULT NULL,
W int DEFAULT NULL,
L int DEFAULT NULL,
G int DEFAULT NULL,
GS int DEFAULT NULL,
CG int DEFAULT NULL,
SHO int DEFAULT NULL,
SV int DEFAULT NULL,
IPouts int DEFAULT NULL,
H int DEFAULT NULL,
ER int DEFAULT NULL,
HR int DEFAULT NULL,
BB int DEFAULT NULL,
SO int DEFAULT NULL,
BAOpp double precision DEFAULT NULL,
ERA double precision DEFAULT NULL,
IBB int DEFAULT NULL,
WP int DEFAULT NULL,
HBP int DEFAULT NULL,
BK int DEFAULT NULL,
BFP int DEFAULT NULL,
GF int DEFAULT NULL,
R int DEFAULT NULL,
SH int DEFAULT NULL,
SF int DEFAULT NULL,
GIDP int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_pitching_1  
ON year2024.pitching(playerID,yearID,stint); 

-- ====================================================================================================
-- pitching_post
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.pitching_post;
CREATE TABLE IF NOT EXISTS year2024.pitching_post (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
playerID varchar(10) NOT NULL,
yearID int NOT NULL,
round varchar(10) NOT NULL,
teamID varchar(3) DEFAULT NULL,
lgID varchar(2) DEFAULT NULL,
W int DEFAULT NULL,
L int DEFAULT NULL,
G int DEFAULT NULL,
GS int DEFAULT NULL,
CG int DEFAULT NULL,
SHO int DEFAULT NULL,
SV int DEFAULT NULL,
IPouts int DEFAULT NULL,
H int DEFAULT NULL,
ER int DEFAULT NULL,
HR int DEFAULT NULL,
BB int DEFAULT NULL,
SO int DEFAULT NULL,
BAOpp double precision DEFAULT NULL,
ERA double precision DEFAULT NULL,
IBB int DEFAULT NULL,
WP int DEFAULT NULL,
HBP int DEFAULT NULL,
BK int DEFAULT NULL,
BFP int DEFAULT NULL,
GF int DEFAULT NULL,
R int DEFAULT NULL,
SH int DEFAULT NULL,
SF int DEFAULT NULL,
GIDP int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_pitching_post_1  
ON year2024.pitching_post(playerID,yearID,round); 

-- ====================================================================================================
-- salaries
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.salaries;
CREATE TABLE IF NOT EXISTS year2024.salaries (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
yearID int NOT NULL,
teamID varchar(3) NOT NULL,
lgID varchar(2) NOT NULL,
playerID varchar(10) NOT NULL,
salary double precision DEFAULT NULL
);

CREATE UNIQUE INDEX ui_salaries_1  
ON year2024.salaries(yearID,teamID,lgID,playerID); 

-- ====================================================================================================
-- schools
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.schools;
CREATE TABLE IF NOT EXISTS year2024.schools (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
schoolID varchar(15) NOT NULL,
name_full varchar(255) DEFAULT NULL,
city varchar(55) DEFAULT NULL,
state varchar(55) DEFAULT NULL,
country varchar(55) DEFAULT NULL
);

CREATE UNIQUE INDEX ui_schools_1  
ON year2024.schools(schoolID); 

-- ====================================================================================================
-- series_post
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.series_post;
CREATE TABLE IF NOT EXISTS year2024.series_post (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
yearID int NOT NULL,
round varchar(5) NOT NULL,
teamIDwinner varchar(3) DEFAULT NULL,
lgIDwinner varchar(2) DEFAULT NULL,
teamIDloser varchar(3) DEFAULT NULL,
lgIDloser varchar(2) DEFAULT NULL,
wins int DEFAULT NULL,
losses int DEFAULT NULL,
ties int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_series_post_1  
ON year2024.series_post(yearID,round); 

-- ====================================================================================================
-- teams
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.teams;
CREATE TABLE IF NOT EXISTS year2024.teams (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
yearID int NOT NULL,
lgID varchar(2) NOT NULL,
teamID varchar(3) NOT NULL,
franchID varchar(3) DEFAULT NULL,
divID varchar(1) DEFAULT NULL,
Rank int DEFAULT NULL,
G int DEFAULT NULL,
Ghome int DEFAULT NULL,
W int DEFAULT NULL,
L int DEFAULT NULL,
DivWin varchar(1) DEFAULT NULL,
WCWin varchar(1) DEFAULT NULL,
LgWin varchar(1) DEFAULT NULL,
WSWin varchar(1) DEFAULT NULL,
R int DEFAULT NULL,
AB int DEFAULT NULL,
H int DEFAULT NULL,
H2B int DEFAULT NULL,
H3B int DEFAULT NULL,
HR int DEFAULT NULL,
BB int DEFAULT NULL,
SO int DEFAULT NULL,
SB int DEFAULT NULL,
CS int DEFAULT NULL,
HBP int DEFAULT NULL,
SF int DEFAULT NULL,
RA int DEFAULT NULL,
ER int DEFAULT NULL,
ERA double precision DEFAULT NULL,
CG int DEFAULT NULL,
SHO int DEFAULT NULL,
SV int DEFAULT NULL,
IPouts int DEFAULT NULL,
HA int DEFAULT NULL,
HRA int DEFAULT NULL,
BBA int DEFAULT NULL,
SOA int DEFAULT NULL,
E int DEFAULT NULL,
DP int DEFAULT NULL,
FP double precision DEFAULT NULL,
name varchar(50) DEFAULT NULL,
park varchar(255) DEFAULT NULL,
attendance int DEFAULT NULL,
BPF int DEFAULT NULL,
PPF int DEFAULT NULL,
teamIDBR varchar(3) DEFAULT NULL,
teamIDlahman45 varchar(3) DEFAULT NULL,
teamIDretro varchar(3) DEFAULT NULL
);

CREATE UNIQUE INDEX ui_teams_1  
ON year2024.teams(yearID,lgID,teamID); 

-- ====================================================================================================
-- teams_franchises
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.teams_franchises;
CREATE TABLE IF NOT EXISTS year2024.teams_franchises (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
franchID varchar(3) NOT NULL,
franchName varchar(50) DEFAULT NULL,
active varchar(2) DEFAULT NULL,
NAassoc varchar(3) DEFAULT NULL
);

CREATE UNIQUE INDEX ui_teams_franchises_1  
ON year2024.teams_franchises(franchID); 

-- ====================================================================================================
-- teams_half
-- ====================================================================================================

DROP TABLE IF EXISTS year2024.teams_half;
CREATE TABLE IF NOT EXISTS year2024.teams_half (
ID uuid PRIMARY KEY DEFAULT gen_random_uuid(),
yearID int NOT NULL,
lgID varchar(2) NOT NULL,
teamID varchar(3) NOT NULL,
Half varchar(1) NOT NULL,
divID varchar(1) DEFAULT NULL,
DivWin varchar(1) DEFAULT NULL,
Rank int DEFAULT NULL,
G int DEFAULT NULL,
W int DEFAULT NULL,
L int DEFAULT NULL
);

CREATE UNIQUE INDEX ui_teams_half_1  
ON year2024.teams_half(yearID,teamID,lgID,Half); 

END TRANSACTION;
