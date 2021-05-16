-- Checks that the country code is 3 letters

{% macro test_check_country_code_regex(model, column_name) %}

WITH
    REGEX_MATCH AS (
        SELECT
            COUNTRY_CODE,
            REGEXP_CONTAINS({{ column_name }}, r'\D{3}') AS MATCH_REGEX
        FROM
        {{ model }}
    )

SELECT COUNT(*) FROM REGEX_MATCH
WHERE MATCH_REGEX IS FALSE

{% endmacro %}
