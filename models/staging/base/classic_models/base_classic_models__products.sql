WITH source_table AS (
    SELECT
        product_code,
        product_name,
        product_line,
        product_scale,
        product_vendor,
        product_description,
        quantity_in_stock,
        buy_price,
        msrp,
        _sync_date
    FROM {{ source('classic_models', 'products') }}
)

SELECT *
FROM source_table
