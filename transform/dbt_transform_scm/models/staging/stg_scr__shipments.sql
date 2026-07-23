WITH source AS (
    SELECT "Shipment_ID" as shipment_id,
           "Date" as date,
           "Origin_Port" as origin_port,
           "Destination_Port" AS destination_port,
           "Transport_Mode" AS transport_mode,
           "Product_Category" AS product_category,
           "Distance_km" AS distance_km,
           "Weight_MT" AS weight_mt,
           "Fuel_Price_Index" as fuel_price_index,
           "Geopolitical_Risk_Score" AS geopolit_risk_score,
           "Weather_Condition" AS weather_condition,
           "Carrier_Reliability_Score" AS carrier_reliability_score,
           "Lead_Time_Days" AS lead_time_days,
           "Disruption_Occurred" AS disruption_occurred
    FROM {{ source('raw_data', 'raw_scm_data_19072026') }}
)

SELECT shipment_id,
       CAST(date AS Date),
       origin_port,
       destination_port,
       transport_mode,
       product_category,
       distance_km,
       weight_mt,
       fuel_price_index,
       geopolit_risk_score,
       weather_condition,
       carrier_reliability_score,
       lead_time_days,
       disruption_occurred
 FROM source