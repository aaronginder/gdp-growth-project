{{ config(materialized='table') }}

SELECT * FROM {{ source('world_bank_global_population', 'population_by_country') }}
