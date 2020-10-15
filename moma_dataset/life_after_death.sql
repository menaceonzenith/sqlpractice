-- Which artist had the most works of art acquired by the MoMA after death?

SELECT sub.artist,
       COUNT(*) as counts_after_death

FROM (SELECT a.artist AS artist,
       SUBSTR(a.dateacquired, 0, 5)::integer AS date_acquired,
       b.enddate::integer AS artist_death
FROM artworks a
LEFT JOIN artist b
ON a.constituentid = b.constituentid
) sub
WHERE sub.date_acquired > sub.artist_death
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1