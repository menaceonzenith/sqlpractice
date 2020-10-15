-- Which artist has the heaviest work of art at the MoMA?

SELECT artist,
       title,
       weight::integer as weight
FROM artworks
WHERE weight IS NOT NULL
ORDER BY weight DESC
LIMIT 1