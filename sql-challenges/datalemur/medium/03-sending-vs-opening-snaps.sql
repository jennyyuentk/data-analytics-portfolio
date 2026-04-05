-- ============================================
-- Platform  : DataLemur
-- Difficulty: Medium
-- Title     : Sending vs. Opening Snaps
-- Company   : Snapchat
-- Link      : https://datalemur.com/questions/time-spent-snaps
-- Date      : 2026-03-20
-- ============================================

-- Question:
-- Calculate the percentage of time spent sending vs opening snaps
-- per age group, rounded to 2 decimal places.

-- Approach: JOIN activities and age_breakdown, filter for send/open
-- using IN, use SUM(CASE WHEN) to isolate each activity's time,
-- divide by total SUM(time_spent) and multiply by 100.0 to get
-- percentage, ROUND to 2 decimal places

-- Solution:
SELECT age_bucket,
  ROUND(SUM(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END) /
    SUM(time_spent) * 100.0, 2) AS send_perc,
  ROUND(SUM(CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 END) /
    SUM(time_spent) * 100.0, 2) AS open_perc
FROM activities AS a
JOIN age_breakdown AS b ON a.user_id = b.user_id
WHERE activity_type IN ('send', 'open')
GROUP BY age_bucket;