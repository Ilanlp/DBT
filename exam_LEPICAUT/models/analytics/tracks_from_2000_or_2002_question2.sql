{{ config(materialized='view', tags=['analytics']) }}

SELECT name
FROM {{ ref('fact_tracks') }}
WHERE prodyear IN (2000, 2002)
LIMIT 10
