WITH source AS (
    SELECT * FROM {{ source('raw_data', 'raw_scm_data_19072026') }}
)

SELECT Shipment_ID FROM source