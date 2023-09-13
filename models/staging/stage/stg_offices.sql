{%- set yaml_metadata -%}
source_model: 'base_classic_models__offices'
derived_columns:
  RECORD_SOURCE: '!BASE_CLASSIC_MODELS__OFFICES'
  LOAD_DATE: '_SYNC_DATE'
  EFFECTIVE_FROM: '_SYNC_DATE'
hashed_columns:
  OFFICE_HK: 'OFFICE_CODE'
  OFFICE_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'OFFICE_CODE'
      - '_SYNC_DATE'
      - 'CITY'
      - 'PHONE'
      - 'ADDRESS_LINE1'
      - 'ADDRESS_LINE2'
      - 'STATE'
      - 'COUNTRY'
      - 'POSTAL_CODE'
      - 'TERRITORY'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=source_model,
                     derived_columns=derived_columns,
                     null_columns=none,
                     hashed_columns=hashed_columns,
                     ranked_columns=none) }}
