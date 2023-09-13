WITH source_table AS (
    SELECT
        order_number,
        product_code,
        quantity_ordered,
        price_each,
        order_line_number,
        _sync_date
    FROM {{ source('classic_models', 'order_details') }}
)

SELECT *
FROM source_table
