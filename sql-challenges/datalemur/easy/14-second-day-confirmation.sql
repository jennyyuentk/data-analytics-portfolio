-- ============================================
-- Platform  : DataLemur
-- Difficulty: Easy
-- Title     : Second Day Confirmation
-- Company   : TikTok
-- Link      : https://datalemur.com/questions/second-day-confirmation
-- Date      : 2026-03-12
-- ============================================

-- Question:
-- Find user IDs who did not confirm on signup day but confirmed
-- exactly on the second day after signup.

-- Approach: JOIN emails and texts on email_id, filter for 'Confirmed'
-- action and use INTERVAL '1 day' to check action was exactly
-- one day after signup, DISTINCT handles duplicate user entries

-- Solution:
SELECT DISTINCT e.user_id
FROM emails AS e
JOIN texts AS t ON e.email_id = t.email_id
WHERE signup_action = 'Confirmed'
  AND action_date = signup_date + INTERVAL '1 day';