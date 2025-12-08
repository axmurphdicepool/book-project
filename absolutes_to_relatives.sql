-- part 1, avg reviews per book, % of books with awards, in a series, bestsellers, classics
SELECT  
  publication_decade
  ,titles
  ,authors
  ,average_review_score
  ,ROUND(total_reviews/titles,2) AS avg_nb_reviews_per_book
  ,average_price
  ,ROUND(nb_books_with_awards/titles,2) AS percent_books_with_awards
  ,ROUND(nb_books_in_a_series/titles,2) AS percent_books_in_series
  ,ROUND(nb_bestsellers/titles,2) AS percent_bestsellers
  ,ROUND(nb_classics/titles,2) AS percent_classics
  ,combined_years_on_bestellers_list
FROM `book-project-479914.trial_and_error.m_dedup_classics_and_bestsellers_over_time`
WHERE publication_decade IN ('1900s','1910s','1920s','1930s','1940s','1950s','1960s','1970s','1980s','1990s','2000s','2010s','2020s') 

-- part 2, % of books above average review score, num reviews, price
WITH global_avgs AS (
  SELECT
    AVG(review_score) AS avg_review_score,
    AVG(reviews_count) AS avg_num_reviews,
    AVG(price_eur) AS avg_price
  FROM `book-project-479914.trial_and_error.m_dedup_pub_decade`
)

, decade_stats AS (
  SELECT
    publication_decade
    ,AVG(CASE WHEN review_score > avg_review_score THEN 1 ELSE 0 END ) 
      AS pct_above_avg_review_score
    ,AVG( CASE WHEN reviews_count > avg_num_reviews THEN 1 ELSE 0 END ) 
      AS pct_above_avg_num_reviews
    ,AVG( CASE WHEN price_eur > avg_price THEN 1 ELSE 0 END ) 
      AS pct_above_avg_price
  FROM `book-project-479914.trial_and_error.m_dedup_pub_decade`, global_avgs
  GROUP BY publication_decade
)

SELECT
  *
FROM book-project-479914.trial_and_error.m_dedup_relat AS part1
LEFT JOIN decade_stats AS part2
  ON part1.publication_decade = part2.publication_decade
ORDER BY part1.publication_decade ASC

