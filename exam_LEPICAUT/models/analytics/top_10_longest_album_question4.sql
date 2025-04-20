{{ config(materialized='view', tags=['analytics']) }}

SELECT g.name, COUNT(*) AS trackcount
FROM {{ ref('dim_genre') }} g
JOIN {{ ref('fact_tracks') }} t ON g.genreid = t.genreid
GROUP BY g.name
ORDER BY trackcount DESC
LIMIT 1
