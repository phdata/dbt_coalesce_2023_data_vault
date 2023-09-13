{%- set source_model = "stg_products" -%}
{%- set src_pk = "LINK_PRODUCT_PRODUCT_LINE_HK" -%}
{%- set src_fk = ["PRODUCT_HK", "PRODUCT_LINE_HK"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}
