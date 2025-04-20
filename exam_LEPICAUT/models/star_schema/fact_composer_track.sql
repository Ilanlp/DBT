{{ config(materialized='table', tags=['star_schema']) }}

SELECT
    t.TrackId,
    d.ComposerId
FROM {{ source('music_src', 'track') }} t
JOIN {{ ref('dim_composer') }} d
  ON t.Composer ILIKE '%' || d.Name || '%'
WHERE t.Composer IS NOT NULL
