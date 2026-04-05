-- ============================================
-- Platform  : DataLemur
-- Difficulty: Medium
-- Title     : Signup Activation Rate
-- Company   : TikTok
-- Link      : https://datalemur.com/questions/signup-confirmation-rate
-- Date      : 2026-03-26
-- ============================================

-- Question:
-- Find the activation rate of users in the emails table who confirmed
-- their signup via text. Round to 2 decimal places.

-- Approach: LEFT JOIN is adopted as not all email users exist in
-- texts table. SUM(CASE WHEN) counts confirmed users, COUNT(email_id)
-- counts all users, cast to numeric to avoid integer division.

-- Solution:
SELECT
  ROUND(
    SUM(CASE WHEN t.signup_action = 'Confirmed' THEN 1 ELSE 0 END)::numeric / 
    COUNT(e.email_id)::numeric, 
  2) AS activation_rate
FROM emails AS e
LEFT JOIN texts AS t ON e.email_id = t.email_id;