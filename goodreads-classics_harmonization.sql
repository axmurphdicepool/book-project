SELECT 
  "goodreads-classics" AS source
  ,title 
  ,author
  ,avg_rating AS review
  ,nb_ratings AS reviews_count
  ,"" AS published_year
  ,"" AS price_eur 
  ,CASE
    WHEN pages > 350 THEN 'long'
    WHEN pages < 250 THEN 'short'
    ELSE 'average'
  END AS length
  ,awards IS NOT NULL AS awards
  ,"" AS bestseller
  ,"true" AS classic 
  ,"" AS publisher
  ,series AS book_series
  ,"" AS genre
  ,"" AS years_on_bestsellers_list
FROM `book-project-479914.cleaned_data.goodreads_classics-v2` 