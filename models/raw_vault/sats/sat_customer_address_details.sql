{%- set source_model = "stg_customers" -%}
{%- set src_pk = "CUSTOMER_HK" -%}
{%- set src_hashdiff = "CUSTOMER_ADDRESS_HASHDIFF" -%}
{%- set src_payload = ['ADDRESS_LINE1', 'ADDRESS_LINE2', 'CITY', 'STATE', 'POSTAL_CODE', 'COUNTRY'] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                   src_payload=src_payload, src_eff=src_eff,
                   src_ldts=src_ldts, src_source=src_source,
                   source_model=source_model) }}
