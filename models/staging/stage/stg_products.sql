{%- set yaml_metadata -%}
source_model: 'base_classic_models__products'
derived_columns:
  RECORD_SOURCE: '!BASE_CLASSIC_MODELS__PRODUCTS'
  LOAD_DATE: '_SYNC_DATE'
  EFFECTIVE_FROM: '_SYNC_DATE'
hashed_columns:
  PRODUCT_HK: 'PRODUCT_CODE'
  PRODUCT_LINE_HK: 'PRODUCT_LINE'
  LINK_PRODUCT_PRODUCT_LINE_HK:
    - 'PRODUCT_CODE'
    - 'PRODUCT_LINE'
  PRODUCT_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'PRODUCT_CODE'
      - '_SYNC_DATE'
      - 'PRODUCT_NAME'
      - 'PRODUCT_LINE'
      - 'PRODUCT_SCALE'
      - 'PRODUCT_VENDOR'
      - 'PRODUCT_DESCRIPTION'
      - 'QUANTITY_IN_STOCK'
      - 'BUY_PRICE'
      - 'MSRP'
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
