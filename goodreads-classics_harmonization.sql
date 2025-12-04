SELECT 
  "Goodreads-classics" AS source
  ,title 
  ,author
  ,avg_rating AS review
  ,nb_ratings AS reviews_count
  ,null AS published_year
  ,null AS price_eur 
  ,CASE
    WHEN pages > 350 THEN 'long'
    WHEN pages < 250 THEN 'short'
    ELSE 'average'
  END AS length
  ,awards IS NOT NULL AS awards
  ,null AS bestseller
  ,TRUE AS classic 
  ,"" AS publisher
  ,series AS book_series
  ,"" AS genre
  ,null AS years_on_bestsellers_list
FROM `book-project-479914.cleaned_data.goodreads_classics-v2` 