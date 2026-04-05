-- ============================================
-- Platform  : DataLemur
-- Difficulty: Easy
-- Title     : Duplicate Job Listings
-- Company   : LinkedIn
-- Link      : https://datalemur.com/questions/duplicate-job-listings
-- Date      : 2026-03-10
-- ============================================

-- Question:
-- Count the number of companies that have posted duplicate job listings
-- (same company, title and description).

-- Approach: CTE groups by company, title and description, HAVING filters
-- for duplicates, then COUNT(DISTINCT company_id) handles companies
-- with multiple duplicate pairs

-- Solution:
WITH dup_cte AS (
  SELECT company_id
  FROM job_listings
  GROUP BY company_id, title, description
  HAVING COUNT(job_id) > 1
)
SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM dup_cte;