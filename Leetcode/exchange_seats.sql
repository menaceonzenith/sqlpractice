-- https://leetcode.com/problems/exchange-seats/

SELECT id,
       student
FROM seat
WHERE id%2 = 1 and id = (SELECT MAX(id) FROM seat)

UNION ALL 

SELECT id-1 as id,
       student
FROM seat
WHERE id%2 = 0

UNION ALL

SELECT id+1 as id,
       student
FROM seat
WHERE id%2 = 1 and id != (SELECT MAX(id) FROM seat)
ORDER BY 1