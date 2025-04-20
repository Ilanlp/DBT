{{ config(materialized='view', tags=['analytics']) }}

SELECT 
    ar.name AS artistname,
    COUNT(DISTINCT t.albumid) AS nbrealbum
FROM {{ ref('fact_tracks') }} t
JOIN {{ ref('dim_artist') }} ar ON t.artistid = ar.artistid
GROUP BY ar.name
ORDER BY nbrealbum DESC
LIMIT 10
