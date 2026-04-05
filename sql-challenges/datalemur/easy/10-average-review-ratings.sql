-- ============================================
-- Platform  : DataLemur
-- Difficulty: Easy
-- Title     : Average Review Ratings
-- Company   : Amazon
-- Link      : https://datalemur.com/questions/sql-avg-review-ratings
-- Date      : 2026-03-11
-- ============================================

-- Question:
-- Find the average star rating for each product grouped by month.
-- Output month as a number, product ID and average stars rounded
-- to 2 decimal places. Sort by month then product ID.

-- Approach: EXTRACT month from submit_date, GROUP BY month and product,
-- use ROUND(AVG(stars), 2) for the rating, ORDER BY month then product

-- Solution:
SELECT 
  EXTRACT(MONTH FROM submit_date) AS mth,
  product_id AS product,
  ROUND(AVG(stars), 2) AS avg_stars
FROM reviews
GROUP BY EXTRACT(MONTH FROM submit_date), product_id
ORDER BY mth, product;