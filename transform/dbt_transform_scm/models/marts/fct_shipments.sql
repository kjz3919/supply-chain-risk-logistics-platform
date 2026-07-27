WITH source AS (
    SELECT * FROM {{ ref('stg_scr__shipments') }}
),

dates AS (
    SELECT * FROM {{ ref('dim_date') }}
),

ports AS (
    SELECT * FROM {{ ref('dim_port') }}
),

product_categories AS (
    SELECT * FROM {{ ref('dim_product_category') }}
),

transport_modes AS (
    SELECT * FROM {{ ref('dim_transport_mode') }}
),

weather_conditions AS (
    SELECT * FROM {{ ref('dim_weather_condition') }}
)


SELECT
    s.shipment_id,
    p.port_id,
    d.date_id,
    t.transport_mode_id,
    c.product_category_id,
    w.weather_condition_id,
    s.distance_km,
    s.weight_mt,
    s.fuel_price_index,
    s.geopolit_risk_score,
    s.carrier_reliability_score,
    s.lead_time_days,
    s.disruption_occurred
FROM source s
LEFT JOIN dates d ON s.date = d.date
LEFT JOIN ports p ON s.origin_port = p.origin_port AND s.destination_port = p.destination_port
LEFT JOIN product_categories c ON s.product_category = c.product_category
LEFT JOIN weather_conditions w ON s.weather_condition = w.weather_condition
LEFT JOIN transport_modes t ON s.transport_mode = t.transport_mode