{{ config(materialized='table', tags=['star_schema']) }}

SELECT
    AlbumId,
    Title,
    ProdYear,
    CdYear AS CdCount
FROM {{ source('music_src', 'album') }}
