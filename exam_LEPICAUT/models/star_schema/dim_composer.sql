{{ config(materialized='table', tags=['star_schema']) }}

WITH cleaned_raw_names AS (
    SELECT
        REPLACE(Composer, 'AC/DC', 'AC-DC') AS Composer
    FROM {{ source('music_src', 'track') }}
    WHERE Composer IS NOT NULL
),
split_names AS (
    SELECT
        TRIM(f3.value) AS raw_name
    FROM cleaned_raw_names,
         LATERAL FLATTEN(input => SPLIT(Composer, ';')) f1,
         LATERAL FLATTEN(input => SPLIT(TRIM(f1.value), '/')) f2,
         LATERAL FLATTEN(input => SPLIT(TRIM(f2.value), '&')) f3
),
distinct_names AS (
    SELECT DISTINCT
        TRIM(REPLACE(raw_name, 'AC-DC', 'AC/DC')) AS ComposerName
    FROM split_names
    WHERE raw_name IS NOT NULL AND TRIM(raw_name) != ''
)
SELECT
    ROW_NUMBER() OVER (ORDER BY ComposerName) AS ComposerId,
    ComposerName AS Name
FROM distinct_names
