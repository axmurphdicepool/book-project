SELECT 
  int64_field_0 AS rank
  ,title
  ,language
  ,series
  ,author
  ,SAFE_CAST(SUBSTR(pages,1,length(pages)-6) AS int64) AS pages
  ,SAFE_CAST(SUBSTRING(avg_rating,3,4) AS float64) AS avg_rating
  ,SAFE_CAST(no_ratings AS int64) AS nb_ratings
  ,awards
FROM `book-project-479914.source_data.goodreads_classics`
ORDER BY rank