{%- set source_model = "stg_order_details" -%}
{%- set src_pk = "LINK_ORDER_PRODUCT_HK" -%}
{%- set src_fk = ["ORDER_HK", "PRODUCT_HK"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}
