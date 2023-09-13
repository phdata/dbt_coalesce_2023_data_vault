{%- set source_model = "stg_employees" -%}
{%- set src_pk = "EMPLOYEE_HK" -%}
{%- set src_hashdiff = "EMPLOYEE_HASHDIFF" -%}
{%- set src_payload = ['LAST_NAME', 'FIRST_NAME', 'EXTENSION', 'EMAIL', 'OFFICE_CODE', 'REPORTS_TO', 'JOB_TITLE'] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                   src_payload=src_payload, src_eff=src_eff,
                   src_ldts=src_ldts, src_source=src_source,
                   source_model=source_model) }}
