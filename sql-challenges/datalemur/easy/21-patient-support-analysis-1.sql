-- ============================================
-- Platform  : DataLemur
-- Difficulty: Easy
-- Title     : Patient Support Analysis (Part 1)
-- Company   : UnitedHealth
-- Link      : https://datalemur.com/questions/frequent-callers
-- Date      : 2026-03-17
-- ============================================

-- Question:
-- Find how many UHG policy holders made three or more calls.

-- Approach: Subquery counts calls per policy holder, outer query
-- uses HAVING to filter for 3+ calls then COUNT(*) for total

-- Solution:
SELECT COUNT(*) AS policy_holder_count
FROM (
  SELECT policy_holder_id
  FROM callers
  GROUP BY policy_holder_id
  HAVING COUNT(*) >= 3
) AS frequent_callers;