-- ============================================
-- Platform  : DataLemur
-- Difficulty: Medium
-- Title     : Spotify Streaming History
-- Company   : Spotify
-- Link      : https://datalemur.com/questions/spotify-streaming-history
-- Date      : 2026-03-26
-- ============================================

-- Question:
-- Output user ID, song ID and cumulative song plays up to August 4th 2022,
-- combining weekly and historical streaming data, sorted descending.

-- Approach: CTE uses UNION ALL as both
-- tables cover different time periods with no true duplicates 
-- to combine weekly plays up to Aug 4th with full historical data
-- COUNT(*) converts weekly row-per-listen to play counts,
-- outer query SUMs both sources per user/song combination.

-- Solution:
WITH agg_info AS (
  SELECT user_id, song_id, COUNT(*) AS plays
  FROM songs_weekly
  WHERE listen_time::date < '08-05-2022'
  GROUP BY user_id, song_id
  UNION ALL
  SELECT user_id, song_id, song_plays
  FROM songs_history
)
SELECT user_id, song_id, SUM(plays) AS song_plays
FROM agg_info
GROUP BY user_id, song_id
ORDER BY song_plays DESC;