-- ============================================
-- Platform  : DataLemur
-- Difficulty: Easy
-- Title     : IBM db2 Product Analytics
-- Company   : IBM
-- Link      : https://datalemur.com/questions/sql-ibm-db2-product-analytics
-- Date      : 2026-03-16
-- ============================================

-- Question:
-- Generate a histogram showing the number of unique queries run by
-- employees in Q3 2023 (July-September), including employees with 0 queries.

-- Approach: LEFT JOIN employees to queries with date filter ON the JOIN
-- o preserve zero-query employees, COUNT(DISTINCT query_id)
-- per employee in CTE, then GROUP BY query count for the histogram

-- Solution:
WITH q_count AS (
  SELECT e.employee_id, 
    COUNT(DISTINCT q.query_id) AS unique_queries
  FROM employees AS e
  LEFT JOIN queries AS q ON q.employee_id = e.employee_id
    AND q.query_starttime::date >= '07-01-2023' 
    AND q.query_starttime::date < '10-01-2023'
  GROUP BY e.employee_id
)
SELECT unique_queries, COUNT(employee_id) AS employee_count
FROM q_count
GROUP BY unique_queries
ORDER BY unique_queries;