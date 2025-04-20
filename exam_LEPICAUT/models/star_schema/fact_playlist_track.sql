{{ config(materialized='table', tags=['star_schema']) }}

SELECT
    PlaylistId,
    TrackId
FROM {{ source('music_src', 'playlisttrack') }}
