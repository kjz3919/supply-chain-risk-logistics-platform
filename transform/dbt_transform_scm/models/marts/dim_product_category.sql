WITH unique_categories AS (
    SELECT DISTINCT product_category FROM {{ ref('stg_scr__shipments') }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['product_category']) }} AS product_category_id,
    product_category
FROM unique_categories