-- ============================================
-- Platform  : DataLemur
-- Difficulty: Easy
-- Title     : Cities With Completed Trades
-- Company   : Robinhood
-- Link      : https://datalemur.com/questions/completed-trades
-- Date      : 2026-03-11
-- ============================================

-- Question:
-- Find the top 3 cities with the highest number of completed trade orders,
-- output city name and total completed orders in descending order.

-- Approach: JOIN trades and users tables on user_id, filter for
-- Completed status, GROUP BY city and COUNT orders,
-- ORDER BY DESC and LIMIT 3 for top cities

-- Solution
SELECT u.city, COUNT(*) AS total_orders
FROM trades AS t
INNER JOIN users AS u ON t.user_id = u.user_id
WHERE t.status = 'Completed'
GROUP BY u.city
ORDER BY total_orders DESC
LIMIT 3;