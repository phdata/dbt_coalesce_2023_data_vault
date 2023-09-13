WITH source_table AS (
    SELECT
        customer_number,
        customer_name,
        customer_last_name,
        customer_first_name,
        phone,
        address_line1,
        address_line2,
        city,
        state,
        postal_code,
        country,
        sales_rep_employee_number,
        credit_limit,
        _sync_date
    FROM {{ source('classic_models', 'customers') }}
)

SELECT *
FROM source_table
