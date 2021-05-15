{{ config(materialized='table') }}

SELECT
    *
from {{ source('gdp_country_growth', 'T1_gdp_annual_growth') }}