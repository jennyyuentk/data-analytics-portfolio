-- ============================================
-- Platform  : DataLemur
-- Difficulty: Easy
-- Title     : Unfinished Parts
-- Company   : Tesla
-- Link      : https://datalemur.com/questions/tesla-unfinished-parts
-- Date      : 2026-03-10
-- ============================================

-- Question:
-- Find the parts and their assembly steps that are still in progress
-- (i.e. have no finish date recorded yet)

-- Approach: Simple WHERE IS NULL filter

-- Solution:
SELECT part, assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;