-- ============================================
-- Platform  : DataLemur
-- Difficulty: Easy
-- Title     : Teams Power Users
-- Company   : Microsoft
-- Link      : https://datalemur.com/questions/teams-power-users
-- Date      : 2026-03-10
-- ============================================

-- Question:
-- Identify the top 2 users who sent the highest number of messages
-- on Microsoft Teams in August 2022.

-- Approach: Filter messages to August 2022 using date range,
-- COUNT messages per sender, ORDER BY DESC and LIMIT 2 for top users

-- Solution:
SELECT sender_id, COUNT(*) AS message_count
FROM messages
WHERE sent_date >= '08-01-2022' AND sent_date < '09-01-2022'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;