-- ============================================
-- Platform  : DataLemur
-- Difficulty: Easy
-- Title     : Data Science Skills
-- Company   : LinkedIn
-- Link      : https://datalemur.com/questions/matching-skills
-- Date      : 2026-03-10
-- ============================================

-- Question:
-- Find candidates proficient in Python, Tableau, and PostgreSQL.
-- List candidate IDs in ascending order.

-- Approach: Filter for the 3 required skills using IN, then GROUP BY candidate
-- and use HAVING COUNT(DISTINCT skill) = 3 to ensure all three skills are present

-- Solution:
-- Note: COUNT(DISTINCT skill) used defensively 
-- even though the problem guarantees no duplicates, 
-- this is safer practice for real-world data

SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(DISTINCT skill) = 3
ORDER BY candidate_id;