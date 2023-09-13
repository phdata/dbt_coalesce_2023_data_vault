{%- set source_model = "stg_offices" -%}
{%- set src_pk = "OFFICE_HK" -%}
{%- set src_hashdiff = "OFFICE_HASHDIFF" -%}
{%- set src_payload = ['CITY', 'PHONE', 'ADDRESS_LINE1', 'ADDRESS_LINE2', 'STATE', 'COUNTRY', 'POSTAL_CODE', 'TERRITORY'] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                   src_payload=src_payload, src_eff=src_eff,
                   src_ldts=src_ldts, src_source=src_source,
                   source_model=source_model) }}
