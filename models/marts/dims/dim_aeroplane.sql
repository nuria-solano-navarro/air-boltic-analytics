-- dim_aeroplane 
-- This dimension shows the outstanding information on the aeroplanes offering services. 
-- The materialization has been assumed to be a table, as it's not expected to grow often. 

{{ config(
    materialized="table"
) }}

SELECT 
  a.airplane_id,
  a.airplane_model,
  a.manufacturer,
  am.max_seats,
  am.max_distance
FROM {{ ref('stg_aeroplanes') }} a
    LEFT JOIN {{ ref('aeroplane_model') }} am
        ON a.airplane_model=am.airplane_model_id