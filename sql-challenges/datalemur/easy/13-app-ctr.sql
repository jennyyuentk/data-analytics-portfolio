-- ============================================
-- Platform  : DataLemur
-- Difficulty: Easy
-- Title     : App Click-through Rate (CTR)
-- Company   : Facebook
-- Link      : https://datalemur.com/questions/click-through-rate
-- Date      : 2026-03-12
-- ============================================

-- Question:
-- Calculate the click-through rate (CTR) for each app in 2022.
-- CTR = 100.0 * clicks / impressions, rounded to 2 decimal places.

-- Approach: CTE uses SUM(CASE WHEN) to count clicks and impressions
-- per app, then divides with ::numeric cast to avoid integer division,
-- date range filter used for better index performance over EXTRACT

-- Solution:
WITH rate_cte AS (
  SELECT 
    app_id,
    SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END) AS imp_rate,
    SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) AS cli_rate
  FROM events
  WHERE timestamp::date >= '01-01-2022' 
    AND timestamp::date < '01-01-2023'
  GROUP BY app_id
)
SELECT 
  app_id,
  ROUND((cli_rate::numeric / imp_rate) * 100, 2) AS ctr
FROM rate_cte;