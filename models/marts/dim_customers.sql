WITH src_customer AS (
    SELECT
        customer_hk,
        load_date,
        customer_name,
        customer_last_name,
        customer_first_name,
        sales_rep_employee_number,
        credit_limit
    FROM {{ ref('sat_customer_details') }}
),

src_customer_phone AS (
    SELECT
        customer_hk,
        load_date,
        phone
    FROM {{ ref('sat_customer_phone_details') }}
),

src_customer_address AS (
    SELECT
        customer_hk,
        load_date,
        address_line1,
        address_line2,
        city,
        state,
        postal_code,
        country
    FROM {{ ref('sat_customer_address_details') }}
),

src_pit_customer AS (
    SELECT
        customer_hk,
        as_of_date AS date_day,
        sat_customer_address_details_pk,
        sat_customer_address_details_ldts,
        sat_customer_details_pk,
        sat_customer_details_ldts,
        sat_customer_phone_details_pk,
        sat_customer_phone_details_ldts
    FROM {{ ref('pit_customer') }}
)

SELECT DISTINCT
    pit.customer_hk AS customer_pk,
    cst.customer_name,
    cst.customer_last_name,
    cst.customer_first_name,
    cst.sales_rep_employee_number,
    cst.credit_limit,
    phn.phone,
    addr.address_line1,
    addr.address_line2,
    addr.city,
    addr.state,
    addr.postal_code,
    addr.country
FROM src_pit_customer pit
    LEFT JOIN src_customer cst
        ON pit.sat_customer_details_pk = cst.customer_hk AND
            pit.sat_customer_details_ldts = cst.load_date
    LEFT JOIN src_customer_phone phn
        ON pit.sat_customer_phone_details_pk = phn.customer_hk AND
            pit.sat_customer_phone_details_ldts = phn.load_date
    LEFT JOIN src_customer_address addr
        ON pit.sat_customer_address_details_pk = addr.customer_hk AND
            pit.sat_customer_address_details_ldts = addr.load_date
