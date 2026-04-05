-- ============================================
-- Platform  : DataLemur
-- Difficulty: Easy
-- Title     : Laptop vs. Mobile Viewership
-- Company   : NY Times
-- Link      : https://datalemur.com/questions/laptop-mobile-viewership
-- Date      : 2026-03-10
-- ============================================

-- Question:
-- Count the number of laptop views and mobile views (tablet + phone)
-- from the viewership table.

-- Approach: Conditional SUM using CASE WHEN to pivot device types

-- Solution:
SELECT
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
  SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views
FROM viewership;