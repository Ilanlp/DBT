{{ config(materialized='view', tags=['analytics']) }}

SELECT a.name, COUNT(t.trackid) AS nbretrack
FROM {{ ref('dim_artist') }} a
LEFT JOIN {{ ref('fact_tracks') }} t ON a.artistid = t.artistid
GROUP BY a.name
ORDER BY nbretrack DESC
LIMIT 10
