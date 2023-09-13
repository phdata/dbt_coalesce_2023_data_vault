{%- set source_model = "stg_product_lines" -%}
{%- set src_pk = "PRODUCT_LINE_HK" -%}
{%- set src_hashdiff = "PRODUCT_LINE_HASHDIFF" -%}
{%- set src_payload = ['TEXT_DESCRIPTION', 'HTML_DESCRIPTION', 'IMAGE'] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                   src_payload=src_payload, src_eff=src_eff,
                   src_ldts=src_ldts, src_source=src_source,
                   source_model=source_model) }}
