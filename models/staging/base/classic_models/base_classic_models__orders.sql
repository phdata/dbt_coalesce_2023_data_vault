WITH source_table AS (
    SELECT
        order_number,
        order_date,
        required_date,
        shipped_date,
        status,
        comments,
        customer_number,
        _sync_date
    FROM {{ source('classic_models', 'orders') }}
)

SELECT *
FROM source_table
