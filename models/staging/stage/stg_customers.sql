{%- set yaml_metadata -%}
source_model: 'base_classic_models__customers'
derived_columns:
  RECORD_SOURCE: '!BASE_CLASSIC_MODELS__CUSTOMERS'
  LOAD_DATE: '_SYNC_DATE'
  EFFECTIVE_FROM: '_SYNC_DATE'
hashed_columns:
  CUSTOMER_HK: 'CUSTOMER_NUMBER'
  EMPLOYEE_HK: 'SALES_REP_EMPLOYEE_NUMBER'
  LINK_CUSTOMER_EMPLOYEE_HK:
    - 'CUSTOMER_NUMBER'
    - 'SALES_REP_EMPLOYEE_NUMBER'
  CUSTOMER_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'CUSTOMER_NUMBER'
      - '_SYNC_DATE'
      - 'CUSTOMER_NAME'
      - 'CUSTOMER_LAST_NAME'
      - 'CUSTOMER_FIRST_NAME'
      - 'SALES_REP_EMPLOYEE_NUMBER'
      - 'CREDIT_LIMIT'
  CUSTOMER_PHONE_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'CUSTOMER_NUMBER'
      - '_SYNC_DATE'
      - 'PHONE'
  CUSTOMER_ADDRESS_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'CUSTOMER_NUMBER'
      - '_SYNC_DATE'
      - 'ADDRESS_LINE1'
      - 'ADDRESS_LINE2'
      - 'CITY'
      - 'STATE'
      - 'POSTAL_CODE'
      - 'COUNTRY'
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
