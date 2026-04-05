-- ============================================
-- Platform  : DataLemur
-- Difficulty: Medium
-- Title     : Top Three Salaries
-- Company   : FAANG
-- Link      : https://datalemur.com/questions/sql-top-three-salaries
-- Date      : 2026-03-23
-- ============================================

-- Question:
-- Identify employees with top 3 salaries in each department.
-- Sort by department name ASC, salary DESC, employee name ASC.

-- Approach: JOIN employee and department tables, DENSE_RANK() 
-- PARTITION BY department_id ranks salaries within each department,
-- DENSE_RANK chosen over ROW_NUMBER to handle duplicate salaries,
-- CTE filters for salary_rank <= 3 with correct multi-column sort

-- Solution:
WITH rank_cte AS (
  SELECT 
    e.name, 
    d.department_name, 
    e.salary,
    DENSE_RANK() OVER(
      PARTITION BY e.department_id 
      ORDER BY salary DESC
    ) AS salary_rank
  FROM employee AS e 
  JOIN department AS d ON e.department_id = d.department_id
)
SELECT name, department_name, salary
FROM rank_cte
WHERE salary_rank <= 3
ORDER BY department_name ASC, salary DESC, name ASC;