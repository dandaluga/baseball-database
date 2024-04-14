BEGIN TRANSACTION;

\COPY year2023.allstar_full(playerID,yearID,gameNum,gameID,teamID,lgID,GP,startingPos) FROM '~/Development/baseball-database/lahman/2023/AllstarFull.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.appearances(yearID,teamID,lgID,playerID,G_all,GS,G_batting,G_defense,G_p,G_c,G_1b,G_2b,G_3b,G_ss,G_lf,G_cf,G_rf,G_of,G_dh,G_ph,G_pr) FROM '~/Development/baseball-database/lahman/2023/Appearances.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.awards_managers(playerID,awardID,yearID,lgID,tie,notes) FROM '~/Development/baseball-database/lahman/2023/AwardsManagers.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.awards_players(playerID,awardID,yearID,lgID,tie,notes) FROM '~/Development/baseball-database/lahman/2023/AwardsPlayers.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.awards_share_managers(awardID,yearID,lgID,playerID,pointsWon,pointsMax,votesFirst) FROM '~/Development/baseball-database/lahman/2023/AwardsShareManagers.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.awards_share_players(awardID,yearID,lgID,playerID,pointsWon,pointsMax,votesFirst) FROM '~/Development/baseball-database/lahman/2023/AwardsSharePlayers.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.batting(playerID,yearID,stint,teamID,lgID,G,G_batting,AB,R,H,H2B,H3B,HR,RBI,SB,CS,BB,SO,IBB,HBP,SH,SF,GIDP) FROM '~/Development/baseball-database/lahman/2023/Batting.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.batting_post(yearID,round,playerID,teamID,lgID,G,AB,R,H,H2B,H3B,HR,RBI,SB,CS,BB,SO,IBB,HBP,SH,SF,GIDP) FROM '~/Development/baseball-database/lahman/2023/BattingPost.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.college_playing(playerID,schoolID,yearID) FROM '~/Development/baseball-database/lahman/2023/CollegePlaying.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.fielding(playerID,yearID,stint,teamID,lgID,POS,G,GS,InnOuts,PO,A,E,DP,PB,WP,SB,CS,ZR) FROM '~/Development/baseball-database/lahman/2023/Fielding.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.fielding_of(playerID,yearID,stint,Glf,Gcf,Grf) FROM '~/Development/baseball-database/lahman/2023/FieldingOF.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.fielding_of_split(playerID,yearID,stint,teamID,lgID,POS,G,GS,InnOuts,PO,A,E,DP,PB,WP,SB,CS,ZR) FROM '~/Development/baseball-database/lahman/2023/FieldingOFsplit.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.fielding_post(playerID,yearID,teamID,lgID,round,POS,G,GS,InnOuts,PO,A,E,DP,TP,PB,SB,CS) FROM '~/Development/baseball-database/lahman/2023/FieldingPost.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.hall_of_fame(playerID,yearID,votedBy,ballots,needed,votes,inducted,category,needed_note) FROM '~/Development/baseball-database/lahman/2023/HallOfFame.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.home_games(year,league,team,park,span_first,span_last,games,openings,attendance) FROM '~/Development/baseball-database/lahman/2023/HomeGames.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.managers(playerID,yearID,teamID,lgID,inseason,G,W,L,rank,plyrMgr) FROM '~/Development/baseball-database/lahman/2023/Managers.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.managers_half(playerID,yearID,teamID,lgID,inseason,half,G,W,L,rank) FROM '~/Development/baseball-database/lahman/2023/ManagersHalf.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.parks(ID,parkalias,parkkey,parkname,city,state,country) FROM '~/Development/baseball-database/lahman/2023/Parks.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.people(ID,playerID,birthYear,birthMonth,birthDay,birthCity,birthCountry,birthState,deathYear,deathMonth,deathDay,deathCountry,deathState,deathCity,nameFirst,nameLast,nameGiven,weight,height,bats,throws,debut,bbrefID,finalGame,retroID) FROM '~/Development/baseball-database/lahman/2023/People.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.pitching(playerID,yearID,stint,teamID,lgID,W,L,G,GS,CG,SHO,SV,IPouts,H,ER,HR,BB,SO,BAOpp,ERA,IBB,WP,HBP,BK,BFP,GF,R,SH,SF,GIDP) FROM '~/Development/baseball-database/lahman/2023/Pitching.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.pitching_post(playerID,yearID,round,teamID,lgID,W,L,G,GS,CG,SHO,SV,IPouts,H,ER,HR,BB,SO,BAOpp,ERA,IBB,WP,HBP,BK,BFP,GF,R,SH,SF,GIDP) FROM '~/Development/baseball-database/lahman/2023/PitchingPost.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.salaries(yearID,teamID,lgID,playerID,salary) FROM '~/Development/baseball-database/lahman/2023/Salaries.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.schools(schoolID,name_full,city,state,country) FROM '~/Development/baseball-database/lahman/2023/Schools.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.series_post(yearID,round,teamIDwinner,lgIDwinner,teamIDloser,lgIDloser,wins,losses,ties) FROM '~/Development/baseball-database/lahman/2023/SeriesPost.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.teams(yearID,lgID,teamID,franchID,divID,Rank,G,Ghome,W,L,DivWin,WCWin,LgWin,WSWin,R,AB,H,H2B,H3B,HR,BB,SO,SB,CS,HBP,SF,RA,ER,ERA,CG,SHO,SV,IPouts,HA,HRA,BBA,SOA,E,DP,FP,name,park,attendance,BPF,PPF,teamIDBR,teamIDlahman45,teamIDretro) FROM '~/Development/baseball-database/lahman/2023/Teams.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.teams_franchises(franchID,franchName,active,NAassoc) FROM '~/Development/baseball-database/lahman/2023/TeamsFranchises.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2023.teams_half(yearID,lgID,teamID,Half,divID,DivWin,Rank,G,W,L) FROM '~/Development/baseball-database/lahman/2023/TeamsHalf.csv' WITH CSV HEADER DELIMITER AS ',';

END TRANSACTION;