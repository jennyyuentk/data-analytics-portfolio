-- ============================================
-- Platform  : DataLemur
-- Difficulty: Medium
-- Title     : User's Third Transaction
-- Company   : Uber
-- Link      : https://datalemur.com/questions/sql-third-transaction
-- Date      : 2026-03-17
-- ============================================

-- Question:
-- Find the third transaction for every user, output user_id,
-- spend and transaction_date.

-- Approach: ROW_NUMBER() window function partitioned by user_id
-- and ordered by transaction_date assigns a rank per user,
-- then filter for row_num = 3 to get each user's third transaction

-- Solution:
WITH ranked_transactions AS (
  SELECT 
    user_id, 
    spend, 
    transaction_date,
    ROW_NUMBER() OVER (
      PARTITION BY user_id 
      ORDER BY transaction_date ASC
    ) AS row_num
  FROM transactions
)
SELECT user_id, spend, transaction_date
FROM ranked_transactions
WHERE row_num = 3;