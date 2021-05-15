{{ config(materialized='table') }}

WITH unpivot_table AS (
    {{ dbt_utils.unpivot(
        relation=ref('T1_country_population'),
        cast_to='string',
        exclude=['country', 'country_code'],
        field_name='year',
        value_name='population'
    ) }}
)

SELECT
    COUNTRY,
    COUNTRY_CODE,
    CAST(regexp_extract(year, r'\d+') AS INT64) AS YEAR,
    CAST(population AS INT64) AS POPULATION,
FROM unpivot_table
WHERE POPULATION IS NOT NULL