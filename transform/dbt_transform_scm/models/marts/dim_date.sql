WITH unique_dates AS (
    SELECT DISTINCT date FROM {{ ref('stg_scr__shipments') }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['date']) }} AS date_id,
    date
FROM unique_dates
