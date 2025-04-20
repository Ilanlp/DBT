{{ config(materialized='view', tags=['analytics']) }}

SELECT title
FROM {{ ref('dim_album') }}
WHERE cdcount > 1