SELECT  
  "Prh-classics" AS source
  ,Title AS title
  ,Author AS author
  ,SAFE_CAST(null AS FLOAT64) AS review
  ,null AS reviews_count
  ,SAFE_CAST(Year AS INT64) AS pblished_year
  ,SAFE_CAST(null AS FLOAT64) AS price_eur
  ,"" AS length
  ,null AS awards
  ,null AS bestseller
  ,SAFE_CAST(1 AS INT64) AS classic
  ,"" AS publisher
  ,"" AS book_series
  ,"" AS genre
  ,null AS years_on_bestsellers_list
FROM `book-project-479914.cleaned_data.classics_list-v2` 


