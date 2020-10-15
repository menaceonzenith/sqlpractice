-- Which artist has the largest volume of artworks at the MoMA?

select artist,
       COUNT(*) as total
FROM artworks
GROUP BY 1
ORDER BY total desc
LIMIT 1