-- ============================================
-- Platform  : DataLemur
-- Difficulty: Easy
-- Title     : Page With No Likes
-- Company   : Facebook
-- Link      : https://datalemur.com/questions/sql-page-with-no-likes
-- Date      : 2026-03-10
-- ============================================

-- Question:
-- Find page IDs of Facebook pages with zero likes.
-- Output in ascending order.

-- Approach: LEFT JOIN + IS NULL to find pages with no matching likes

-- Solution:
SELECT p.page_id
FROM pages AS p
LEFT JOIN page_likes AS l ON p.page_id = l.page_id
WHERE l.liked_date IS NULL
ORDER BY p.page_id ASC;