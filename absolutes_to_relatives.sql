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