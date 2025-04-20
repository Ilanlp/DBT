{{ config(materialized='view', tags=['analytics']) }}

SELECT t.name
FROM {{ ref('fact_tracks') }} t
JOIN {{ ref('dim_genre') }} d ON t.genreid = d.genreid
JOIN {{ ref('dim_artist') }} a ON t.artistid = a.artistid
JOIN {{ ref('dim_country') }} c ON a.countryid = c.countryid
WHERE d.name ILIKE '%rock%' AND c.countryname ILIKE 'france'
LIMIT 10
