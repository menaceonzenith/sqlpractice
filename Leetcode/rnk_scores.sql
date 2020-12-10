-- https://leetcode.com/problems/rank-scores/

SELECT sub.score as score, sub.rnk as 'Rank'
FROM (SELECT id, score,
       DENSE_RANK() OVER (ORDER BY Score DESC) as rnk 
FROM Scores) sub
ORDER BY 1 DESC