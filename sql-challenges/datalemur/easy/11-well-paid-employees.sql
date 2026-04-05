-- ============================================
-- Platform  : DataLemur
-- Difficulty: Easy
-- Title     : Well Paid Employees
-- Company   : FAANG
-- Link      : https://datalemur.com/questions/sql-well-paid-employees
-- Date      : 2026-03-11
-- ============================================

-- Question:
-- Find all employees who earn more than their direct managers.
-- Output the employee ID and name.

-- Approach: Self JOIN on the same employee table — e1 as the employee,
-- e2 as the manager, joined on manager_id = employee_id,
-- then WHERE filters for employees earning more than their manager

-- Solution:
SELECT e1.employee_id, e1.name AS employee_name
FROM employee AS e1
INNER JOIN employee AS e2 ON e1.manager_id = e2.employee_id
WHERE e1.salary > e2.salary;