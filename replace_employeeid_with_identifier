https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/

SELECT CASE WHEN unique_id IS NULL THEN NULL
       ELSE unique_id END as unique_id,
       name
FROM Employees
LEFT JOIN EmployeeUNI
ON Employees.id = EmployeeUNI.id