{{ config(materialized='view', tags=['analytics']) }}


SELECT g.name, SUM(DISTINCT t.trackid) as nbre_tracks_annee_2000
FROM {{ ref('dim_genre') }} g
JOIN {{ ref('fact_tracks') }} t ON t.genreid = g.genreid
WHERE t.prodyear = 2000
GROUP BY g.name
ORDER BY SUM(DISTINCT t.trackid) DESC

LIMIT 1
