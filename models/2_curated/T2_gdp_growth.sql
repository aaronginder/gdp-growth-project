{{ config(materialized='table') }}

WITH unpivot_table AS (
    {{ dbt_utils.unpivot(
        relation=source('gdp_country_growth', 'T1_gdp_annual_growth'),
        cast_to='float64',
        exclude=['Country_Name', 'Country_Code', 'Indicator_Name', 'Indicator_Code'],
        field_name='year',
        value_name='gdp_dollars'
    ) }}
)

SELECT
    COUNTRY_NAME,
    COUNTRY_CODE,
    INDICATOR_NAME,
    INDICATOR_CODE,
    CAST(regexp_extract(year, r'\d+') AS INT64) AS YEAR,
    GDP_DOLLARS AS GDP_VALUE,
    "Dollars" AS CURRENCY
FROM unpivot_table
WHERE GDP_DOLLARS IS NOT NULL