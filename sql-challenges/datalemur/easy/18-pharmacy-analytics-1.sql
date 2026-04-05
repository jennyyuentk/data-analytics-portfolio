-- ============================================
-- Platform  : DataLemur
-- Difficulty: Easy
-- Title     : Pharmacy Analytics (Part 1)
-- Company   : CVS Health
-- Link      : https://datalemur.com/questions/top-profitable-drugs
-- Date      : 2026-03-17
-- ============================================

-- Question:
-- Find the top 3 most profitable drugs sold.
-- Total Profit = Total Sales - Cost of Goods Sold (COGS)
-- Display from highest to lowest profit.

-- Approach: Simple subtraction of cogs from total_sales per drug,
-- ORDER BY profit DESC and LIMIT 3 to get top 3

-- Solution:
SELECT drug, 
  total_sales - cogs AS total_profit
FROM pharmacy_sales
ORDER BY total_profit DESC
LIMIT 3;