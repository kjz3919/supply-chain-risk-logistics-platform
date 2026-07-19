WITH source AS (
    SELECT * FROM raw_data
)

SELECT origin_port, destination_port FROM raw_data;