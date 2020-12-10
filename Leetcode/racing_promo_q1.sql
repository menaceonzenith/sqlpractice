WITH greaterthan100 AS (
SELECT DISTINCT accountid
FROM activity
WHERE handle >= 100),

user_info AS (SELECT DISTINCT g.accountid,
       u.username,
       u.email
FROM greaterthan100 g
LEFT JOIN user1 u
ON g.accountid = u.accountid),

user_info2 AS (SELECT u.*, SUM(a.handle) as total_handle, ROUND(CAST (SUM(a.grossrevenue)/SUM(a.handle) as numeric), 2) as margin
FROM user_info u
LEFT JOIN activity a
ON u.accountid = a.accountid
WHERE EXTRACT(YEAR FROM a.racedate::timestamp) = 2020
GROUP BY 1,2,3),

recent_bets AS (SELECT DISTINCT sub.accountid, sub.racedate 
FROM (SELECT a.accountid, a.racedate, DENSE_RANK() OVER (PARTITION BY a.accountid ORDER BY a.racedate DESC) as rnk
FROM activity a) sub
WHERE sub.rnk = 1),

total_deposits AS (SELECT playerid, SUM(payment_amount) as total_deposit
FROM deposit
WHERE payment_status = 'a'
GROUP BY 1)


SELECT u.*, b.racedate, d.total_deposit
FROM user_info2 u
LEFT JOIN recent_bets b ON u.accountid = b.accountid
LEFT JOIN total_deposits d ON u.accountid = d.playerid
