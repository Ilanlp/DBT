{{ config(materialized='table', tags=['star_schema']) }}

WITH country_list AS (
    SELECT DISTINCT
        TRIM(Country) as CountryName
    FROM {{ source('music_src', 'artist') }}
    WHERE Country IS NOT NULL
)

SELECT 
    ROW_NUMBER() OVER (ORDER BY CountryName) as CountryId,
    CountryName
FROM country_list
