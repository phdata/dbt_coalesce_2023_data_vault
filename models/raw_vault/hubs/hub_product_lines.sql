{%- set source_model = "stg_product_lines" -%}
{%- set src_pk = "PRODUCT_LINE_HK" -%}
{%- set src_nk = "PRODUCT_LINE" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                   src_source=src_source, source_model=source_model) }}
