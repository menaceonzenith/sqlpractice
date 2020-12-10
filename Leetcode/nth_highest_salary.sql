-- https://leetcode.com/problems/nth-highest-salary/
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      SELECT CASE WHEN sub2.salary IS NULL THEN NULL ELSE sub2.salary END as getNthHighestSalary
      FROM (SELECT *
      FROM (SELECT id, salary,
             DENSE_RANK() OVER (ORDER BY Salary DESC) as rnk
      FROM Employee) sub
      WHERE rnk = n) sub2
      LIMIT 1
  );
END