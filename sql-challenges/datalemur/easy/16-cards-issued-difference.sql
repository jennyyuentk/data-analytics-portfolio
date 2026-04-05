-- ============================================
-- Platform  : DataLemur
-- Difficulty: Easy
-- Title     : Cards Issued Difference
-- Company   : JPMorgan Chase
-- Link      : https://datalemur.com/questions/cards-issued-difference
-- Date      : 2026-03-16
-- ============================================

-- Question:
-- Find the difference between the highest and lowest number of cards
-- issued per month for each credit card, ordered by largest disparity.

-- Approach: GROUP BY card name, subtract MIN from MAX issued amount
-- to get the monthly disparity, ORDER BY difference DESC

-- Solution:
SELECT card_name,
  MAX(issued_amount) - MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC;