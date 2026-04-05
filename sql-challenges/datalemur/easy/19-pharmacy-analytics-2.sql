-- ============================================
-- Platform  : DataLemur
-- Difficulty: Easy
-- Title     : Pharmacy Analytics (Part 2)
-- Company   : CVS Health
-- Link      : https://datalemur.com/questions/non-profitable-drugs
-- Date      : 2026-03-17
-- ============================================

-- Question:
-- Find manufacturers whose drugs resulted in losses for CVS Health.
-- Output manufacturer name, number of loss-making drugs, and total
-- losses in absolute value, sorted by highest losses first.

-- Approach: WHERE filters loss-making drugs (total_sales < cogs),
-- GROUP BY manufacturer, SUM(cogs - total_sales) flips the sign
-- to express losses as positive values

-- Solution:
SELECT 
  manufacturer, 
  COUNT(*) AS drug_count, 
  SUM(cogs - total_sales) AS total_loss  
FROM pharmacy_sales
WHERE total_sales - cogs < 0
GROUP BY manufacturer
ORDER BY total_loss DESC;