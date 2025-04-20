{{ config(materialized='view', tags=['analytics']) }}

SELECT 
    t.name AS trackname,
    LISTAGG(d.name, ', ') WITHIN GROUP (ORDER BY d.name) AS composernames
FROM {{ ref('fact_tracks') }} t
JOIN {{ ref('dim_genre') }} g ON t.genreid = g.genreid
JOIN {{ ref('fact_composer_track') }} ftc ON t.trackid = ftc.trackid
JOIN {{ ref('dim_composer') }} d ON ftc.composerid = d.composerid
WHERE g.name IN ('Rock', 'Jazz')
GROUP BY t.trackid, t.name
LIMIT 10
