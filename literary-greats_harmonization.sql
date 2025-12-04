SELECT  
  "Literary-greats" AS source
  ,title #drop if null
  ,author
  ,rating AS review
  ,number_ratings AS reviews_count
  ,EXTRACT(YEAR FROM first_publication_date) AS published_year
  ,price AS price_eur
  ,CASE
    WHEN SAFE_CAST(pages AS INT64) > 350 THEN 'long'
    WHEN SAFE_CAST(pages AS INT64) < 250 THEN 'short'
    ELSE 'average'
  END AS length
  ,SAFE_CAST(1 AS INT64) IS NOT NULL AS awards
  ,null AS bestseller
  ,null AS classic
  ,publisher
  ,series AS book_series
  ,genres
  ,null AS years_on_bestsellers_list
FROM `book-project-479914.cleaned_data.literary_greats-v2`
WHERE title IS NOT NULL
  AND author IS NOT NULL