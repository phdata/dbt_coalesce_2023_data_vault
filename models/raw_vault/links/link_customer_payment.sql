{%- set source_model = "stg_payments" -%}
{%- set src_pk = "LINK_CUSTOMER_PAYMENT_HK" -%}
{%- set src_fk = ["CUSTOMER_HK", "PAYMENT_HK"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}
