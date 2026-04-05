-- ============================================
-- Platform  : DataLemur
-- Difficulty: Medium
-- Title     : Tweets' Rolling Averages
-- Company   : Twitter
-- Link      : https://datalemur.com/questions/rolling-average-tweets
-- Date      : 2026-03-20
-- ============================================

-- Question:
-- Calculate the 3-day rolling average of tweets for each user.
-- Output user ID, tweet date and rolling average rounded to 2 decimal places.

-- Approach: AVG() window function with PARTITION BY user_id to reset
-- per user, ORDER BY tweet_date for chronological order,
-- ROWS BETWEEN 2 PRECEDING AND CURRENT ROW defines the 3-day window
-- (current day + 2 preceding days = 3 days total)

-- Solution:
SELECT 
  user_id,
  tweet_date,
  ROUND(AVG(tweet_count) OVER(
    PARTITION BY user_id 
    ORDER BY tweet_date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ), 2) AS rolling_avg_3d
FROM tweets;