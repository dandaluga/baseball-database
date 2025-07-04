BEGIN TRANSACTION;

\COPY year2024.allstar_full(playerID,yearID,gameNum,gameID,teamID,lgID,GP,startingPos) FROM '~/Developer/baseball-database/lahman/2024/data/AllstarFull.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.appearances(yearID,teamID,lgID,playerID,G_all,GS,G_batting,G_defense,G_p,G_c,G_1b,G_2b,G_3b,G_ss,G_lf,G_cf,G_rf,G_of,G_dh,G_ph,G_pr) FROM '~/Developer/baseball-database/lahman/2024/data/Appearances.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.awards_managers(playerID,awardID,yearID,lgID,tie,notes) FROM '~/Developer/baseball-database/lahman/2024/data/AwardsManagers.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.awards_players(playerID,awardID,yearID,lgID,tie,notes) FROM '~/Developer/baseball-database/lahman/2024/data/AwardsPlayers.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.awards_share_managers(awardID,yearID,lgID,playerID,pointsWon,pointsMax,votesFirst) FROM '~/Developer/baseball-database/lahman/2024/data/AwardsShareManagers.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.awards_share_players(awardID,yearID,lgID,playerID,pointsWon,pointsMax,votesFirst) FROM '~/Developer/baseball-database/lahman/2024/data/AwardsSharePlayers.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.batting(playerID,yearID,stint,teamID,lgID,G,G_batting,AB,R,H,H2B,H3B,HR,RBI,SB,CS,BB,SO,IBB,HBP,SH,SF,GIDP,G_old) FROM '~/Developer/baseball-database/lahman/2024/data/Batting.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.batting_post(yearID,round,playerID,teamID,lgID,G,AB,R,H,H2B,H3B,HR,RBI,SB,CS,BB,SO,IBB,HBP,SH,SF,GIDP) FROM '~/Developer/baseball-database/lahman/2024/data/BattingPost.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.college_playing(playerID,schoolID,yearID) FROM '~/Developer/baseball-database/lahman/2024/data/CollegePlaying.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.fielding(playerID,yearID,stint,teamID,lgID,POS,G,GS,InnOuts,PO,A,E,DP,PB,WP,SB,CS,ZR) FROM '~/Developer/baseball-database/lahman/2024/data/Fielding.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.fielding_of(playerID,yearID,stint,Glf,Gcf,Grf) FROM '~/Developer/baseball-database/lahman/2024/data/FieldingOF.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.fielding_of_split(playerID,yearID,stint,teamID,lgID,POS,G,GS,InnOuts,PO,A,E,DP,PB,WP,SB,CS,ZR) FROM '~/Developer/baseball-database/lahman/2024/data/FieldingOFsplit.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.fielding_post(playerID,yearID,teamID,lgID,round,POS,G,GS,InnOuts,PO,A,E,DP,TP,PB,SB,CS) FROM '~/Developer/baseball-database/lahman/2024/data/FieldingPost.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.hall_of_fame(playerID,yearID,votedBy,ballots,needed,votes,inducted,category,needed_note) FROM '~/Developer/baseball-database/lahman/2024/data/HallOfFame.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.home_games(year,league,team,park,span_first,span_last,games,openings,attendance) FROM '~/Developer/baseball-database/lahman/2024/data/HomeGames.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.managers(playerID,yearID,teamID,lgID,inseason,G,W,L,rank,plyrMgr) FROM '~/Developer/baseball-database/lahman/2024/data/Managers.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.managers_half(playerID,yearID,teamID,lgID,inseason,half,G,W,L,rank) FROM '~/Developer/baseball-database/lahman/2024/data/ManagersHalf.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.parks(ID,parkalias,parkkey,parkname,city,state,country) FROM '~/Developer/baseball-database/lahman/2024/data/Parks.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.people(ID,playerID,birthYear,birthMonth,birthDay,birthCity,birthCountry,birthState,deathYear,deathMonth,deathDay,deathCountry,deathState,deathCity,nameFirst,nameLast,nameGiven,weight,height,bats,throws,debut,bbrefID,finalGame,retroID) FROM '~/Developer/baseball-database/lahman/2024/data/People.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.pitching(playerID,yearID,stint,teamID,lgID,W,L,G,GS,CG,SHO,SV,IPouts,H,ER,HR,BB,SO,BAOpp,ERA,IBB,WP,HBP,BK,BFP,GF,R,SH,SF,GIDP) FROM '~/Developer/baseball-database/lahman/2024/data/Pitching.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.pitching_post(playerID,yearID,round,teamID,lgID,W,L,G,GS,CG,SHO,SV,IPouts,H,ER,HR,BB,SO,BAOpp,ERA,IBB,WP,HBP,BK,BFP,GF,R,SH,SF,GIDP) FROM '~/Developer/baseball-database/lahman/2024/data/PitchingPost.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.salaries(yearID,teamID,lgID,playerID,salary) FROM '~/Developer/baseball-database/lahman/2024/data/Salaries.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.schools(schoolID,name_full,city,state,country) FROM '~/Developer/baseball-database/lahman/2024/data/Schools.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.series_post(yearID,round,teamIDwinner,lgIDwinner,teamIDloser,lgIDloser,wins,losses,ties) FROM '~/Developer/baseball-database/lahman/2024/data/SeriesPost.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.teams(yearID,lgID,teamID,franchID,divID,Rank,G,Ghome,W,L,DivWin,WCWin,LgWin,WSWin,R,AB,H,H2B,H3B,HR,BB,SO,SB,CS,HBP,SF,RA,ER,ERA,CG,SHO,SV,IPouts,HA,HRA,BBA,SOA,E,DP,FP,name,park,attendance,BPF,PPF,teamIDBR,teamIDlahman45,teamIDretro) FROM '~/Developer/baseball-database/lahman/2024/data/Teams.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.teams_franchises(franchID,franchName,active,NAassoc) FROM '~/Developer/baseball-database/lahman/2024/data/TeamsFranchises.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.teams_half(yearID,lgID,teamID,Half,divID,DivWin,Rank,G,W,L) FROM '~/Developer/baseball-database/lahman/2024/data/TeamsHalf.csv' WITH CSV HEADER DELIMITER AS ',';

END TRANSACTION;