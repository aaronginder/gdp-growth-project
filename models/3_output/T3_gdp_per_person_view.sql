WITH GDP_POPULATION AS (
  SELECT
    GDP.COUNTRY_NAME,
    GDP.COUNTRY_CODE,
    GDP.INDICATOR_NAME,
    GDP.INDICATOR_CODE,
    GDP.YEAR,
    GDP.GDP_VALUE,
    GDP.CURRENCY,
    POP.POPULATION
  FROM
    `inspiring-rite-311915.gdp_country_growth.T2_gdp_growth` GDP
  LEFT JOIN
    `inspiring-rite-311915.gdp_country_growth.T2_country_population` POP
  ON
    GDP.COUNTRY_CODE = POP.COUNTRY_CODE
    AND GDP.YEAR = POP.YEAR
)

SELECT
  *,
  GDP_VALUE/POPULATION AS GDP_PER_PERSON
FROM GDP_POPULATION