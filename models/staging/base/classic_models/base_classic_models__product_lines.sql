WITH source_table AS (
    SELECT
        product_line,
        text_description,
        html_description,
        image,
        _sync_date
    FROM {{ source('classic_models', 'product_lines') }}
)

SELECT *
FROM source_table
