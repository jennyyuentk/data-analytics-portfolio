-- ============================================
-- Platform  : DataLemur
-- Difficulty: Easy
-- Title     : Pharmacy Analytics (Part 3)
-- Company   : CVS Health
-- Link      : https://datalemur.com/questions/total-drugs-sales
-- Date      : 2026-03-17
-- ============================================

-- Question:
-- Calculate total drug sales per manufacturer, rounded to nearest million,
-- formatted as "$X million". Sort by highest sales, then alphabetically.

-- Approach: SUM total_sales per manufacturer, divide by 1 million and
-- ROUND for clean figure, CONCAT to format as "$X million",
-- ORDER BY SUM(total_sales) DESC then manufacturer ASC for ties

-- Solution:
SELECT 
  manufacturer,
  CONCAT('$', ROUND(SUM(total_sales) / 1000000), ' million') AS sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC, manufacturer ASC;