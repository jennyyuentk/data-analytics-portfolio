-- ============================================
-- Platform  : DataLemur
-- Difficulty: Medium
-- Title     : Second Highest Salary
-- Company   : FAANG
-- Link      : https://datalemur.com/questions/sql-second-highest-salary
-- Date      : 2026-03-17
-- ============================================

-- Question:
-- Find the second highest salary among all employees.
-- If multiple employees share the same second highest salary,
-- display it only once.

-- Approach: DENSE_RANK() is chosen to correctly handle duplicate salaries.
-- Filter for salary_rank = 2 to get second highest.

-- Solution:
WITH ranked_salaries AS (
  SELECT 
    salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
  FROM employee
)
SELECT salary AS second_highest_salary
FROM ranked_salaries
WHERE salary_rank = 2;