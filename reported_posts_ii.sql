

SELECT ROUND(AVG(spam_avg)*100,2) as average_daily_percent
FROM (SELECT sub.action_date,
       sub.removal_counts/sub.counts as spam_avg
FROM (SELECT a.action_date as action_date,
       a.extra as extra,
       a.post_id as post_id,
       COUNT(*) as counts,
       removal_counts
FROM Actions a
LEFT JOIN (SELECT post_id,
                  remove_date,
                  COUNT(*) as removal_counts
           FROM Removals 
           GROUP BY 1) r
      
ON a.post_id = r.post_id
WHERE a.extra = 'spam'
GROUP BY 1, 2) sub
 ) sub2


SELECT ROUND(AVG(spam_avg)*100, 2) AS average_daily_percent
FROM (SELECT sub.action_date,
       sub.spam_removals / sub.total_spam_count AS spam_avg
       
FROM (SELECT actions.post_id,
       action_date,
       COUNT(*) AS total_spam_count,
       COALESCE(spam_removals, 0) as spam_removals
FROM Actions
LEFT JOIN (SELECT post_id, COUNT(*) as spam_removals
           FROM Removals
           GROUP BY 1) removals
ON Actions.post_id = removals.post_id
WHERE actions.extra = 'spam'
GROUP BY 1,2) sub) sub2