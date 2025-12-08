SELECT 
  source AS nb_sources
  ,title
  ,author
  ,review AS review_score
  ,reviews_count
  ,published_year
  ,CASE
    WHEN published_year >= 1600 AND published_year <= 1699 THEN '1600s'
    WHEN published_year >= 1700 AND published_year <= 1799 THEN '1900s'
    WHEN published_year >= 1800 AND published_year <= 1899 THEN '1900s'
    WHEN published_year >= 1900 AND published_year <= 1910 THEN '1900s'
    WHEN published_year >= 1911 AND published_year <= 1920 THEN '1910s'
    WHEN published_year >= 1921 AND published_year <= 1930 THEN '1920s'
    WHEN published_year >= 1931 AND published_year <= 1940 THEN '1930s'
    WHEN published_year >= 1941 AND published_year <= 1950 THEN '1940s'
    WHEN published_year >= 1951 AND published_year <= 1960 THEN '1950s'
    WHEN published_year >= 1961 AND published_year <= 1970 THEN '1960s'
    WHEN published_year >= 1971 AND published_year <= 1980 THEN '1970s'
    WHEN published_year >= 1981 AND published_year <= 1990 THEN '1980s'
    WHEN published_year >= 1991 AND published_year <= 2000 THEN '1990s'
    WHEN published_year >= 2001 AND published_year <= 2010 THEN '2000s'
    WHEN published_year >= 2011 AND published_year <= 2020 THEN '2010s'
    WHEN published_year >= 2021 THEN '2020s'
  END AS publication_decade
  ,price_eur
  ,LOWER(length) AS length
  ,awards
  ,bestseller
  ,classic
  ,book_series
  ,years_on_bestsellers_list
  ,genre
FROM book-project-479914.trial_and_error.m_deduplicated
WHERE published_year IS NOT NULL;

SELECT 
  publication_decade
  ,COUNT(DISTINCT title) AS titles
  ,COUNT(DISTINCT author) AS authors
  ,ROUND(AVG(review_score),2) AS average_review_score
  ,ROUND(SUM(reviews_count),2) AS total_reviews
  ,ROUND(AVG(price_eur),2) AS average_price
  ,ROUND(SUM(awards),2) AS nb_books_with_awards
  ,ROUND(SUM(book_series),2) AS nb_books_in_a_series
  ,ROUND(SUM(bestseller),2) AS nb_bestsellers
  ,ROUND(SUM(SAFE_CAST(classic AS INT64)),2) AS nb_classics
  ,SUM(years_on_bestsellers_list) AS combined_years_on_bestellers_list
FROM `book-project-479914.trial_and_error.m_dedup_pub_decade`
GROUP BY publication_decade
ORDER BY publication_decade ASC;