SELECT 
  Rank as rank
  ,Title as title
  ,Author as author
  ,LEFT(Year, 4) AS year
FROM `book-project-479914.source_data.classics_list`
ORDER BY Rank ASC;
