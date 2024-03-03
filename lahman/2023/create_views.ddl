BEGIN TRANSACTION;

-- ====================================================================================================
-- batting_view: This view sums the player stats by year and league in the event a player 
--               has multiple stints across leagues (Ex: AL -> NL -> AL)
-- ====================================================================================================

-- DROP VIEW IF EXISTS year2023.batting_view;

CREATE VIEW year2023.batting_view AS (
  SELECT
      yearid,
      playerid,
      lgid,
      sum(g) as g,
      sum(ab) as ab,
      sum(r) as r,
      sum(h) as h,
      sum(h2b) as h2b,
      sum(h3b) as h3b,
      sum(hr) as hr,
      sum(rbi) as rbi,
      sum(sb) as sb,
      sum(cs) as cs,
      sum(bb) as bb,
      sum(so) as so,
      sum(ibb) as ibb,
      sum(hbp) as hbp,
      sum(sh) as sh,
      sum(sf) as sf,
      sum(gidp) as gidp
  FROM year2023.batting
  GROUP BY yearid, playerid, lgid
);

-- ====================================================================================================
-- pitching_view: This view sums the player stats by year and league in the event a player
--                has multiple stints across leagues (Ex: AL -> NL -> AL)
--                Need to calulate era and baoop. You can't just use an average.
-- ====================================================================================================

-- DROP VIEW IF EXISTS year2023.pitching_view;

CREATE VIEW year2023.pitching_view AS (
  SELECT
      yearid,
      playerid,
      lgid,
      sum(w) as w,
      sum(l) as l,
      sum(g) as g,
      sum(gs) as gs,
      sum(cg) as cg,
      sum(sho) as sho,
      sum(sv) as sv,
      sum(ipouts) as ipouts,
      sum(h) as h,
      sum(er) as er,
      sum(hr) as hr,
      sum(bb) as bb,
      sum(so) as so,
      sum(ibb) as ibb,
      9 * sum(er)/cast((sum(ipouts)/3.0) as double precision) as era,
      sum(wp) as wp,
      sum(hbp) as hbp,
      sum(bk) as bk,
      sum(bfp) as bfp,
      sum(gf) as gf,
      sum(r) as r,
      sum(sh) as sh,
      sum(sf) as sf,
      sum(gidp) as gidp
  FROM year2023.pitching
  GROUP BY yearid, playerid, lgid
);

END TRANSACTION;
