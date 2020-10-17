-- Top 100 Highest Rated Films Actresses

SELECT sub2.primarytitle,
       sub2.titletype,
       "primaryName",
       sub2.category,
       sub2.average_rating
FROM (SELECT sub.tconst,
             primarytitle,
             titletype,
             sub.nconst,
             sub.category,
             sub.average_rating       
FROM (SELECT p.tconst,
       p.category,
       p.nconst,
       r.average_rating
FROM title_principals p
LEFT JOIN title_ratings r
ON p.tconst = r.tconst
WHERE p.category = 'actress') sub
LEFT JOIN title_basics
ON sub.tconst = title_basics.tconst
WHERE titletype = 'movie' AND sub.average_rating::float > 8
ORDER BY sub.average_rating DESC
LIMIT 100) sub2
LEFT JOIN name_basics
ON sub2.nconst = name_basics.nconst