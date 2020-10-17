https://leetcode.com/problems/bank-account-summary-ii/

SELECT u.name as name,
       SUM(t.amount) as balance
FROM Transactions t
LEFT JOIN Users u
ON t.account = u.account
GROUP BY 1
HAVING balance > 10000