https://leetcode.com/problems/apples-oranges/submissions/

SELECT fruit1.sale_date,
       apple_total - oranges_total AS diff
FROM (SELECT sale_date,
       fruit as apples,
       SUM(sold_num) as apple_total
FROM Sales
WHERE fruit = 'apples'
GROUP BY 1, 2) fruit1
LEFT JOIN (SELECT sale_date,
       fruit as oranges,
       SUM(sold_num) as oranges_total
FROM Sales
WHERE fruit = 'oranges'
GROUP BY 1, 2) fruit2
ON fruit1.sale_date = fruit2.sale_date
GROUP BY 1
ORDER BY 1 ASC