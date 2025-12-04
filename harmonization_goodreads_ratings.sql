 SELECT
    'Goodreads-ratings' as source,
    title,
    authors as author,
    average_rating as review,
    ratings_count as reviews_count,
    EXTRACT(YEAR FROM SAFE.PARSE_DATE('%m/%d/%Y', publication_date)) AS published_year,
    null as price_eur,
    '' as length,
    null as awards,
    null as bestseller,
    null as classic,
    publisher,
    '' as book_series,
    '' as genre,
    null as years_on_bestseller_list 
    FROM
        `cleaned_data.goodreads_ratings_CLEANED`