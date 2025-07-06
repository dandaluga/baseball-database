BEGIN TRANSACTION;

\COPY year2024.allstar_full(player_id,year_id,gameNum,game_id,team_id,lg_id,GP,startingPos) FROM '~/Developer/baseball-database/lahman/2024/data/AllstarFull.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.appearances(year_id,team_id,lg_id,player_id,G_all,GS,G_batting,G_defense,G_p,G_c,G_1b,G_2b,G_3b,G_ss,G_lf,G_cf,G_rf,G_of,G_dh,G_ph,G_pr) FROM '~/Developer/baseball-database/lahman/2024/data/Appearances.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.awards_managers(player_id,award_id,year_id,lg_id,tie,notes) FROM '~/Developer/baseball-database/lahman/2024/data/AwardsManagers.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.awards_players(player_id,award_id,year_id,lg_id,tie,notes) FROM '~/Developer/baseball-database/lahman/2024/data/AwardsPlayers.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.awards_share_managers(award_id,year_id,lg_id,player_id,pointsWon,pointsMax,votesFirst) FROM '~/Developer/baseball-database/lahman/2024/data/AwardsShareManagers.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.awards_share_players(award_id,year_id,lg_id,player_id,pointsWon,pointsMax,votesFirst) FROM '~/Developer/baseball-database/lahman/2024/data/AwardsSharePlayers.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.batting(player_id,year_id,stint,team_id,lg_id,G,G_batting,AB,R,H,H2B,H3B,HR,RBI,SB,CS,BB,SO,IBB,HBP,SH,SF,GIDP,G_old) FROM '~/Developer/baseball-database/lahman/2024/data/Batting.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.batting_post(year_id,round,player_id,team_id,lg_id,G,AB,R,H,H2B,H3B,HR,RBI,SB,CS,BB,SO,IBB,HBP,SH,SF,GIDP) FROM '~/Developer/baseball-database/lahman/2024/data/BattingPost.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.college_playing(player_id,school_id,year_id) FROM '~/Developer/baseball-database/lahman/2024/data/CollegePlaying.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.fielding(player_id,year_id,stint,team_id,lg_id,POS,G,GS,InnOuts,PO,A,E,DP,PB,WP,SB,CS,ZR) FROM '~/Developer/baseball-database/lahman/2024/data/Fielding.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.fielding_of(player_id,year_id,stint,Glf,Gcf,Grf) FROM '~/Developer/baseball-database/lahman/2024/data/FieldingOF.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.fielding_of_split(player_id,year_id,stint,team_id,lg_id,POS,G,GS,InnOuts,PO,A,E,DP,PB,WP,SB,CS,ZR) FROM '~/Developer/baseball-database/lahman/2024/data/FieldingOFsplit.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.fielding_post(player_id,year_id,team_id,lg_id,round,POS,G,GS,InnOuts,PO,A,E,DP,TP,PB,SB,CS) FROM '~/Developer/baseball-database/lahman/2024/data/FieldingPost.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.hall_of_fame(player_id,year_id,votedBy,ballots,needed,votes,inducted,category,needed_note) FROM '~/Developer/baseball-database/lahman/2024/data/HallOfFame.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.home_games(year,league,team,park,span_first,span_last,games,openings,attendance) FROM '~/Developer/baseball-database/lahman/2024/data/HomeGames.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.managers(player_id,year_id,team_id,lg_id,inseason,G,W,L,rank,plyrMgr) FROM '~/Developer/baseball-database/lahman/2024/data/Managers.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.managers_half(player_id,year_id,team_id,lg_id,inseason,half,G,W,L,rank) FROM '~/Developer/baseball-database/lahman/2024/data/ManagersHalf.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.parks(ID,parkalias,parkkey,parkname,city,state,country) FROM '~/Developer/baseball-database/lahman/2024/data/Parks.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.people(ID,player_id,birthYear,birthMonth,birthDay,birthCity,birthCountry,birthState,deathYear,deathMonth,deathDay,deathCountry,deathState,deathCity,nameFirst,nameLast,nameGiven,weight,height,bats,throws,debut,bbref_id,finalGame,retro_id) FROM '~/Developer/baseball-database/lahman/2024/data/People.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.pitching(player_id,year_id,stint,team_id,lg_id,W,L,G,GS,CG,SHO,SV,IPouts,H,ER,HR,BB,SO,BAOpp,ERA,IBB,WP,HBP,BK,BFP,GF,R,SH,SF,GIDP) FROM '~/Developer/baseball-database/lahman/2024/data/Pitching.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.pitching_post(player_id,year_id,round,team_id,lg_id,W,L,G,GS,CG,SHO,SV,IPouts,H,ER,HR,BB,SO,BAOpp,ERA,IBB,WP,HBP,BK,BFP,GF,R,SH,SF,GIDP) FROM '~/Developer/baseball-database/lahman/2024/data/PitchingPost.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.salaries(year_id,team_id,lg_id,player_id,salary) FROM '~/Developer/baseball-database/lahman/2024/data/Salaries.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.schools(school_id,name_full,city,state,country) FROM '~/Developer/baseball-database/lahman/2024/data/Schools.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.series_post(year_id,round,team_idwinner,lg_idwinner,team_idloser,lg_idloser,wins,losses,ties) FROM '~/Developer/baseball-database/lahman/2024/data/SeriesPost.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.teams(year_id,lg_id,team_id,franch_id,div_id,Rank,G,Ghome,W,L,DivWin,WCWin,LgWin,WSWin,R,AB,H,H2B,H3B,HR,BB,SO,SB,CS,HBP,SF,RA,ER,ERA,CG,SHO,SV,IPouts,HA,HRA,BBA,SOA,E,DP,FP,name,park,attendance,BPF,PPF,team_idBR,team_idlahman45,team_idretro) FROM '~/Developer/baseball-database/lahman/2024/data/Teams.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.teams_franchises(franch_id,franchName,active,NAassoc) FROM '~/Developer/baseball-database/lahman/2024/data/TeamsFranchises.csv' WITH CSV HEADER DELIMITER AS ',';

\COPY year2024.teams_half(year_id,lg_id,team_id,Half,div_id,DivWin,Rank,G,W,L) FROM '~/Developer/baseball-database/lahman/2024/data/TeamsHalf.csv' WITH CSV HEADER DELIMITER AS ',';

END TRANSACTION;