CREATE OR REPLACE TABLE
    `cleaned_data.goodreads_ratings_CLEANED`
    as
SELECT
    bookID,
    title,
    authors,
    SAFE_CAST(average_rating AS FLOAT64) AS average_rating, 
    isbn,
    isbn13,
    language_code,
    CAST(ratings_count AS INT64) AS ratings_count,
    text_reviews_count,
    publication_date,
    publisher
FROM
    `source_data.goodreads_ratings`
WHERE
    SAFE_CAST(average_rating AS FLOAT64) IS NOT NULL;