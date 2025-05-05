-- fact_trips

{{ config(
    materialized="incremental"
) }}

with trips_derived as (
    SELECT 
        t.trip_id,
        t.origin_city,
        t.destination_city,
        t.airplane_id,
        t.start_ts,
        t.end_ts,
        DATE_DIFF(t.end_ts, t.start_ts, HOUR) AS trip_duration
    FROM {{ ref('stg_trips') }} t

), 

orders_derived AS (
    SELECT 
        o.trip_id, 
        MAX(o.price_in_eur) AS max_price,
        MIN(o.price_in_eur) AS min_price,
        AVG(o.price_in_eur) AS avg_price,
        COUNT(o.order_id) as seats_booked
    FROM {{ ref('stg_orders') }} o
    GROUP BY o.trip_id

)

SELECT 
    td.trip_id,
    td.origin_city,
    td.destination_city,
    td.airplane_id,
    td.start_ts,
    td.end_ts,
    td.trip_duration,
    CASE WHEN td.trip_duration < 3 THEN 'SHORT'
        ELSE WHEN td.trip_duration < 6 THEN 'MID'
        ELSE 'LONG'
        END AS trip_category,
    od.max_price,
    od.min_price,
    od.avg_price,
    od.seats_booked
FROM trips_derived td
    LEFT JOIN orders_derived od
        ON td.trip_id=od.trip_id