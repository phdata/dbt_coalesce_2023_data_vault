WITH source_table AS (
    SELECT
        office_code,
        city,
        phone,
        address_line1,
        address_line2,
        state,
        country,
        postal_code,
        territory,
        _sync_date
    FROM {{ source('classic_models', 'offices') }}
)

SELECT *
FROM source_table
