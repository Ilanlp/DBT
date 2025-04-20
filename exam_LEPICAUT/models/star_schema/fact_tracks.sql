{{ config(materialized='table', tags=['star_schema']) }}

SELECT
    t.TrackId,
    t.Name,
    t.AlbumId,
    t.GenreId,
    t.MediaTypeId,
    a.ArtistId,
    t.Milliseconds,
    t.Bytes,
    t.UnitPrice,
    al.ProdYear AS ProdYear
FROM {{ source('music_src', 'track') }} t
JOIN {{ source('music_src', 'album') }} al ON t.AlbumId = al.AlbumId
JOIN {{ source('music_src', 'artist') }} a ON al.ArtistId = a.ArtistId
