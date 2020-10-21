-- Create an absolute ratings ranking (averageRating * numVotes) and return top 100


SELECT sub.primarytitle,
       sub.absolute_rating,
       RANK() OVER (ORDER BY sub.absolute_rating DESC)
       
FROM (SELECT primarytitle,
       r.average_rating::float * r.num_votes::float AS absolute_rating
FROM title_basics b
LEFT JOIN title_ratings r
ON b.tconst = r.tconst
WHERE r.average_rating IS NOT NULL AND r.num_votes IS NOT NULL AND b.titletype = 'movie'
) sub
LIMIT 100