{{ config(materialized='table', tags=['star_schema']) }}

SELECT
    PlaylistId,
    Name
FROM {{ source('music_src', 'playlist') }}
