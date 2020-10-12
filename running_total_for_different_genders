https://leetcode.com/problems/running-total-for-different-genders/

SELECT gender,
       day,
       SUM(score_points) OVER (PARTITION BY gender ORDER BY gender,day) as total
FROM Scores
GROUP BY 1,2