-- What are the MoMA's 5 oldest piece of artworks?

SELECT title,
       date,
       SUBSTR(result, 0, 5)::integer as years

FROM (SELECT title,
             date,
       NULLIF(regexp_replace(date, '\D','','g'), '') AS result
FROM artworks) sub
ORDER BY years ASC
LIMIT 5