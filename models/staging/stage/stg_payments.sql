{%- set yaml_metadata -%}
source_model: 'base_classic_models__payments'
derived_columns:
  RECORD_SOURCE: '!BASE_CLASSIC_MODELS__PAYMENTS'
  LOAD_DATE: '_SYNC_DATE'
  EFFECTIVE_FROM: 'PAYMENT_DATE'
hashed_columns:
  PAYMENT_HK: 'CHECK_NUMBER'
  CUSTOMER_HK: 'CUSTOMER_NUMBER'
  LINK_CUSTOMER_PAYMENT_HK: 
    - 'CUSTOMER_NUMBER'
    - 'CHECK_NUMBER'
  PAYMENT_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'CUSTOMER_NUMBER'
      - 'CHECK_NUMBER'
      - 'PAYMENT_DATE'
      - 'AMOUNT'
      - '_SYNC_DATE'
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
