{{ config(materialized='table', tags=['star_schema']) }}

SELECT
    MediaTypeId,
    Name
FROM {{ source('music_src', 'mediatype') }}
