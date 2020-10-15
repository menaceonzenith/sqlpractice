https://leetcode.com/problems/department-highest-salary/

SELECT sub.Department,
       sub.Employee,
       sub.salary
FROM (SELECT d.name as Department,
       e.name as Employee,
       RANK() OVER (PARTITION BY d.name ORDER BY e.salary DESC) as rnk,
       e.salary
FROM Employee e
LEFT JOIN Department d
ON e.DepartmentID = d.Id
GROUP BY 1,2) sub
WHERE rnk = 1 AND sub.Department IS NOT NULL