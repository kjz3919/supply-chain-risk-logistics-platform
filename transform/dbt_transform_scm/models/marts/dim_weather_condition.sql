WITH unique_conditions AS (
    SELECT DISTINCT weather_condition FROM {{ ref('stg_scr__shipments') }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['weather_condition']) }} AS weather_condition_id,
    weather_condition
FROM unique_conditions