-- ============================================
-- Platform  : DataLemur
-- Difficulty: Easy
-- Title     : Final Account Balance
-- Company   : PayPal
-- Link      : https://datalemur.com/questions/final-account-balance
-- Date      : 2026-03-12
-- ============================================

-- Question:
-- Calculate the final account balance for each account, considering
-- all deposits and withdrawals recorded in the transactions table.

-- Approach: SUM with CASE WHEN to add deposits and subtract withdrawals
-- in a single pass, GROUP BY account_id for per-account balance

-- Solution:
SELECT
  account_id,
  SUM(CASE WHEN transaction_type = 'Deposit' THEN amount ELSE -amount END) AS final_balance
FROM transactions
GROUP BY account_id;