SELECT 
  "Goodreads-classics" AS source
  ,title 
  ,author
  ,avg_rating AS review
  ,nb_ratings AS reviews_count
  ,SAFE_CAST(null AS INT64) AS published_year
  ,SAFE_CAST(null AS FLOAT64) AS price_eur 
  ,CASE
    WHEN pages > 350 THEN 'long'
    WHEN pages < 250 THEN 'short'
    ELSE 'average'
  END AS length
  ,awards IS NOT NULL AS awards
  ,SAFE_CAST(null AS INT64) AS bestseller
  ,SAFE_CAST(1 AS INT64) AS classic 
  ,"" AS publisher
  ,series AS book_series
  ,"" AS genre
  ,SAFE_CAST(null AS INT64) AS years_on_bestsellers_list
FROM `book-project-479914.cleaned_data.goodreads_classics-v2` 