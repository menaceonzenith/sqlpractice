-- Which are the MoMA's first 5 acquisitions?

select title,
       artist,
       dateacquired::timestamp as date_acquired
from artworks
ORDER By date_acquired ASC
LIMIT 5