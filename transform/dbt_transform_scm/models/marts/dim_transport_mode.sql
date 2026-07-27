WITH unique_transport_mode AS (
    SELECT DISTINCT transport_mode FROM {{ ref('stg_scr__shipments') }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['transport_mode']) }} as transport_mode_id,
    transport_mode
FROM unique_transport_mode