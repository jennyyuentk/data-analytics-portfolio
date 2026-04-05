-- ============================================
-- Platform  : DataLemur
-- Difficulty: Medium
-- Title     : Highest-Grossing Items
-- Company   : Amazon
-- Link      : https://datalemur.com/questions/sql-highest-grossing
-- Date      : 2026-03-20
-- ============================================

-- Question:
-- Identify the top 2 highest-grossing products within each category
-- in 2022. Output category, product and total spend.

-- Approach: CTE calculates total spend per category/product with date
-- filter, DENSE_RANK() PARTITION BY category ranks products by spend
-- within each category, outer query filters for top 2 per category

-- Solution:
WITH ranking_cte AS (
  SELECT 
    category, 
    product, 
    SUM(spend) AS total_spend,
    DENSE_RANK() OVER(
      PARTITION BY category
      ORDER BY SUM(spend) DESC
    ) AS spend_rank
  FROM product_spend
  WHERE transaction_date::date >= '01-01-2022' 
    AND transaction_date::date < '01-01-2023'
  GROUP BY category, product
)
SELECT category, product, total_spend
FROM ranking_cte
WHERE spend_rank <= 2;