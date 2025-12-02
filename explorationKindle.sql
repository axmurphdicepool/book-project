CREATE OR REPLACE TABLE
    `cleaned_data.kindle_data-v2_CLEANED`
    as
SELECT
*
FROM
    `source_data.kindle_data-v2`
WHERE
    author is not null 