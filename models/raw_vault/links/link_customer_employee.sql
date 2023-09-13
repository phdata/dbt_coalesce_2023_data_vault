{%- set source_model = "stg_customers" -%}
{%- set src_pk = "LINK_CUSTOMER_EMPLOYEE_HK" -%}
{%- set src_fk = ["CUSTOMER_HK", "EMPLOYEE_HK"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}
