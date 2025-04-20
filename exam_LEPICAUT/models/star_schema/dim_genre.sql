{{ config(materialized='table', tags=['star_schema']) }}

SELECT
    GenreId,
    Name
FROM {{ source('music_src', 'genre') }}
