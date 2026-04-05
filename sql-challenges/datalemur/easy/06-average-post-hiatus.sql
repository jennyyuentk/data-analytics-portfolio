-- ============================================
-- Platform  : DataLemur
-- Difficulty: Easy
-- Title     : Average Post Hiatus (Part 1)
-- Company   : Facebook
-- Link      : https://datalemur.com/questions/sql-average-post-hiatus-1
-- Date      : 2026-03-10
-- ============================================

-- Question:
-- For users who posted at least twice in 2021, find the number of days
-- between their first and last post of the year.

-- Approach: Filter posts to 2021, GROUP BY user, subtract MIN from MAX
-- post date to get the gap, HAVING COUNT > 1 excludes single-post users

-- Solution:
SELECT user_id, 
  MAX(post_date::date) - MIN(post_date::date) AS days_between
FROM posts
WHERE EXTRACT(YEAR FROM post_date) = 2021
GROUP BY user_id
HAVING COUNT(post_id) > 1;