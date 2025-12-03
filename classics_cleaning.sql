WITH Kafka AS (
  SELECT
    Rank
    ,Title
    ,LEFT(Author,11) AS Author
    ,SUBSTRING(Author, 14, 4) AS Year
  FROM `book-project-479914.source_data.classics_list`
  WHERE rank = 84
),

Others AS (
  SELECT
    Rank
    ,Title
    ,Author
    ,LEFT(Year,4) AS year
  FROM `book-project-479914.source_data.classics_list`
  WHERE rank <> 84
)

SELECT * FROM Kafka
UNION ALL
SELECT * FROM Others
