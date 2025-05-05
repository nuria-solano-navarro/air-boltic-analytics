-- dim_aeroplane 

{{ config(
    materialized="incremental"
) }}

SELECT 
  a.airplane_id,
  a.airplane_model,
  a.manufacturer,
  am.max_seats,
  am.max_distance
FROM {{ ref('stg_aeroplaness') }} a
    LEFT JOIN {{ ref('aeroplane_model') }} am
        ON a.airplane_model=am.airplane_model_id