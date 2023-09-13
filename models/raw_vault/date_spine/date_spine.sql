{%- set datepart = "day" -%}
{%- set start_date = "TO_DATE('2023/08/28', 'yyyy/mm/dd')" -%}
{%- set end_date = "(SELECT CURRENT_DATE())" -%}

WITH as_of_date AS (
    {{ dbt_utils.date_spine(datepart=datepart, 
                            start_date=start_date,
                            end_date=end_date) }}
)

SELECT DATE_{{ datepart }} AS as_of_date FROM as_of_date
