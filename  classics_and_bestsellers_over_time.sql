SELECT  
  publication_decade
  ,COUNT(DISTINCT title) AS titles
  ,COUNT(DISTINCT author) AS authors
  ,ROUND(AVG(review),2) AS average_review_score
  ,ROUND(SUM(reviews_count),2) AS total_reviews
  ,ROUND(AVG(price_eur),2) AS average_price
  ,ROUND(SUM(SAFE_CAST(classic AS INT64)),2) AS nb_classics
  ,ROUND(SUM(bestseller),2) AS nb_bestsellers
  ,SUM(years_on_bestsellers_list) AS combined_years_on_bestellers_list
FROM `book-project-479914.trial_and_error.m_pub-decade` 
GROUP BY publication_decade
ORDER BY publication_decade ASC