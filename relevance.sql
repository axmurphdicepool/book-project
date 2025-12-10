WITH title_count AS (SELECT 
  title
  ,COUNT(title) AS nb_editions
  ,MIN(published_year) AS earliest_publication_year
  ,MAX(published_year) AS latest_publication_year
FROM `book-project-479914.harmonized_data.maybe_final_concat`
GROUP BY title
HAVING COUNT(title) > 1
)

,classics_count AS (
  SELECT 
    title
    ,MAX(SAFE_CAST(classics AS INT)) AS classic
  FROM book-project-479914.trial_and_error.m_added_classics_vw
  GROUP BY title  
)

SELECT 
  original.title AS title
  ,title_count.nb_editions AS nb_editions
  ,(latest_publication_year - earliest_publication_year) AS nb_years_published
  ,earliest_publication_year
  ,latest_publication_year
  ,original.bestseller AS bestseller
  ,original.years_on_bestsellers_list AS years_on_bestsellers_list
  ,classics_count.classic AS classic
FROM `book-project-479914.harmonized_data.maybe_final_concat` AS original
  LEFT JOIN title_count USING (title)
  LEFT JOIN classics_count USING (title)