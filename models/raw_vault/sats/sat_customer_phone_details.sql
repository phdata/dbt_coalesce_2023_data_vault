{%- set source_model = "stg_customers" -%}
{%- set src_pk = "CUSTOMER_HK" -%}
{%- set src_hashdiff = "CUSTOMER_PHONE_HASHDIFF" -%}
{%- set src_payload = ['PHONE'] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                   src_payload=src_payload, src_eff=src_eff,
                   src_ldts=src_ldts, src_source=src_source,
                   source_model=source_model) }}
