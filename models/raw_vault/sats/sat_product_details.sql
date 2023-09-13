{%- set source_model = "stg_products" -%}
{%- set src_pk = "PRODUCT_HK" -%}
{%- set src_hashdiff = "PRODUCT_HASHDIFF" -%}
{%- set src_payload = ['PRODUCT_NAME', 'PRODUCT_LINE', 'PRODUCT_SCALE', 'PRODUCT_VENDOR', 'PRODUCT_DESCRIPTION', 'QUANTITY_IN_STOCK', 'BUY_PRICE', 'MSRP'] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                   src_payload=src_payload, src_eff=src_eff,
                   src_ldts=src_ldts, src_source=src_source,
                   source_model=source_model) }}
