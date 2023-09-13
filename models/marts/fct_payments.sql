WITH src_payment_details AS (
    SELECT
        payment_hk,
        check_number,
        payment_date,
        amount
    FROM {{ ref('sat_payment_details') }}
),

src_payment_customer AS (
    SELECT
        payment_hk,
        customer_hk
    FROM {{ ref('link_customer_payment') }}
)

SELECT
    pay_cust.customer_hk AS customer_pk,
    pay_dtl.check_number,
    pay_dtl.payment_date,
    pay_dtl.amount
FROM src_payment_details pay_dtl
    LEFT JOIN src_payment_customer pay_cust
        ON pay_dtl.payment_hk = pay_cust.payment_hk
