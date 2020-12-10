https://leetcode.com/problems/department-top-three-salaries/

SELECT sub.Department,
       sub.Employee,
       sub.salary
FROM (SELECT d.name as Department,
       e.name as Employee,
       DENSE_RANK() OVER (PARTITION BY d.name ORDER BY e.salary DESC) as rnk,
       e.salary
FROM Employee e
LEFT JOIN Department d
ON e.DepartmentID = d.Id
WHERE d.name IS NOT NULL
GROUP BY 1,2) sub
WHERE rnk =  1 OR rnk = 2 OR rnk = 3 AND sub.Department IS NOT NULL