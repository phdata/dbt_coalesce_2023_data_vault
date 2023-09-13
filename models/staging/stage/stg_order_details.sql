{%- set yaml_metadata -%}
source_model: 'base_classic_models__order_details'
derived_columns:
  RECORD_SOURCE: '!BASE_CLASSIC_MODELS__ORDER_DETAILS'
  LOAD_DATE: '_SYNC_DATE'
  EFFECTIVE_FROM: '_SYNC_DATE'
hashed_columns:
  ORDER_DETAILS_HK: 
    - 'ORDER_NUMBER'
    - 'ORDER_LINE_NUMBER'
  ORDER_HK: 'ORDER_NUMBER'
  PRODUCT_HK: 'PRODUCT_CODE'
  LINK_ORDER_PRODUCT_HK:
    - 'ORDER_NUMBER'
    - 'PRODUCT_CODE'
  ORDER_PRODUCT_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'ORDER_NUMBER'
      - 'ORDER_LINE_NUMBER'
      - '_SYNC_DATE'
      - 'PRODUCT_CODE'
      - 'QUANTITY_ORDERED'
      - 'PRICE_EACH'
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
