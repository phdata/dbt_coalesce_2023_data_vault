{%- set yaml_metadata -%}
source_model: 'base_classic_models__employees'
derived_columns:
  RECORD_SOURCE: '!BASE_CLASSIC_MODELS__EMPLOYEES'
  LOAD_DATE: '_SYNC_DATE'
  EFFECTIVE_FROM: '_SYNC_DATE'
hashed_columns:
  EMPLOYEE_HK: 'EMPLOYEE_NUMBER'
  MANAGER_HK: 'REPORTS_TO'
  OFFICE_HK: 'OFFICE_CODE'
  LINK_EMPLOYEE_OFFICE_HK:
    - 'EMPLOYEE_NUMBER'
    - 'OFFICE_CODE'
  LINK_EMPLOYEE_MANAGER_HK:
    - 'EMPLOYEE_NUMBER'
    - 'REPORTS_TO'
  EMPLOYEE_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'EMPLOYEE_NUMBER'
      - '_SYNC_DATE'
      - 'LAST_NAME'
      - 'FIRST_NAME'
      - 'EXTENSION'
      - 'EMAIL'
      - 'OFFICE_CODE'
      - 'REPORTS_TO'
      - 'JOB_TITLE'
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
