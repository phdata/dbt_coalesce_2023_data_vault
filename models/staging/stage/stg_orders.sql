{%- set yaml_metadata -%}
source_model: 'base_classic_models__orders'
derived_columns:
  RECORD_SOURCE: '!BASE_CLASSIC_MODELS__ORDERS'
  LOAD_DATE: '_SYNC_DATE'
  EFFECTIVE_FROM: 'ORDER_DATE'
hashed_columns:
  ORDER_HK: 'ORDER_NUMBER'
  CUSTOMER_HK: 'CUSTOMER_NUMBER'
  LINK_CUSTOMER_ORDER_HK:
    - 'ORDER_NUMBER'
    - 'CUSTOMER_NUMBER'
  ORDER_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'ORDER_NUMBER'
      - 'ORDER_DATE'
      - 'CUSTOMER_NUMBER'
      - '_SYNC_DATE'
      - 'REQUIRED_DATE'
      - 'SHIPPED_DATE'
      - 'STATUS'
      - 'COMMENTS'
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
