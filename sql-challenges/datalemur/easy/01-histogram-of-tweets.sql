-- ============================================
-- Platform  : DataLemur
-- Difficulty: Easy
-- Title     : Histogram of Tweets
-- Company   : Twitter
-- Link      : https://datalemur.com/questions/sql-histogram-tweets
-- Date      : 2026-03-09
-- ============================================

-- Question:
-- Assume you're given a table of tweet data, 
-- write a query to obtain a histogram of tweets 
-- posted per user in 2022.

-- Approach: Two-step aggregation using CTE
-- Step 1: Count total tweets per user in 2022 using EXTRACT for date filtering
-- Step 2: Group users by their tweet count to build the histogram buckets

-- Solution:
WITH tweets_per_user AS (
  SELECT 
    user_id, 
    COUNT(*) AS tweet_count
  FROM tweets
  WHERE EXTRACT(YEAR FROM tweet_date) = 2022
  GROUP BY user_id
)
SELECT 
  tweet_count AS tweet_bucket, 
  COUNT(*)    AS users_num
FROM tweets_per_user
GROUP BY tweet_count
ORDER BY tweet_bucket;