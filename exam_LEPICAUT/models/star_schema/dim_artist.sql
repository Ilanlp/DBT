{{ config(materialized='table', tags=['star_schema']) }}

SELECT 
    a.ArtistId,
    a.Name,
    a.BirthYear,
    c.CountryId
FROM {{ source('music_src', 'artist') }} a
JOIN {{ ref('dim_country') }} c 
  ON TRIM(a.Country) = c.CountryName
