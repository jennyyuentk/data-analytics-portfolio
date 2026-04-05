-- ============================================
-- Platform  : DataLemur
-- Difficulty: Easy
-- Title     : Compressed Mean
-- Company   : Alibaba
-- Link      : https://datalemur.com/questions/alibaba-compressed-mean
-- Date      : 2026-03-16
-- ============================================

-- Question:
-- Find the mean number of items per order rounded to 1 decimal place
-- from a frequency table of item counts and order occurrences.

-- Approach: Weighted average = SUM(item_count * order_occurrences) /
-- SUM(order_occurrences), cast to numeric to avoid integer division,
-- ROUND to 1 decimal place

-- Solution:
SELECT 
  ROUND(
    SUM(item_count * order_occurrences)::numeric / SUM(order_occurrences), 
  1) AS mean
FROM items_per_order;