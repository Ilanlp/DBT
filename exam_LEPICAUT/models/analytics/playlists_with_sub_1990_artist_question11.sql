{{ config(materialized='view', tags=['analytics']) }}

SELECT DISTINCT p.name AS playlistname
FROM {{ ref('fact_tracks') }} t
JOIN {{ ref('fact_playlist_track') }} pt ON t.trackid = pt.trackid
JOIN {{ ref('dim_playlist') }} p ON pt.playlistid = p.playlistid
JOIN {{ ref('dim_artist') }} a ON t.artistid = a.artistid
WHERE a.BirthYear < 1990
