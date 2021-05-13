{{ config(materialized='table') }}

SELECT
    *
from {{ source('GDP_Growth', 'RAW_GDP_Data') }}