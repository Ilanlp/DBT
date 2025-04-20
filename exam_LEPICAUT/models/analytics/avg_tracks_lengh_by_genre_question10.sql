{{ config(materialized='view', tags=['analytics']) }}

SELECT
    g.name AS genre,
    ROUND(AVG(t.milliseconds / 1000 / 60)) AS moytrack_minutes
FROM {{ ref('dim_genre') }} g
JOIN {{ ref('fact_tracks') }} t ON g.genreid = t.genreid
GROUP BY g.name
LIMIT 10
