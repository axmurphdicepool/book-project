SELECT  
  "Prh-api" AS source
  ,title
  ,author
  ,SAFE_CAST(null AS FLOAT64) AS review
  ,null AS reviews_count
  ,null AS published_year
  ,SAFE_CAST(price AS FLOAT64) AS price_eur
  ,CASE
    WHEN pages > 350 THEN 'long'
    WHEN pages < 250 THEN 'short'
    ELSE 'average'
  END AS length
  ,null AS awards
  ,null AS bestseller
  ,null AS classic
  ,"" AS publisher
  ,"" AS book_series
  ,"" AS genre
  ,null AS years_on_bestsellers_list
FROM `book-project-479914.source_data.penguin_api`