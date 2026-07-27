WITH unique_ports AS (
    SELECT DISTINCT origin_port, destination_port FROM {{ ref('stg_scr__shipments') }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['origin_port', 'destination_port']) }} as port_id,
    origin_port,
    destination_port
FROM unique_ports