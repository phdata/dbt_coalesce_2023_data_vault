{%- set source_model = "stg_payments" -%}
{%- set src_pk = "PAYMENT_HK" -%}
{%- set src_hashdiff = "PAYMENT_HASHDIFF" -%}
{%- set src_payload = ['CHECK_NUMBER', 'PAYMENT_DATE', 'AMOUNT'] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                   src_payload=src_payload, src_eff=src_eff,
                   src_ldts=src_ldts, src_source=src_source,
                   source_model=source_model) }}
