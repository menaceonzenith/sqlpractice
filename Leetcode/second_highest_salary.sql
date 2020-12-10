https://leetcode.com/problems/second-highest-salary/submissions/

SELECT MAX(Salary) as SecondHighestSalary
FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee)