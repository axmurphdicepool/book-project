Column Documentation:

1. source — STRING

Always "Amazon". Shows that all records come from Amazon’s bestseller lists.

2. title — STRING

3. author — STRING

4. review — FLOAT64

Average customer rating for the book across all years it appeared on the bestseller list.

5. reviews_count — INT64

Total number of customer ratings, using the maximum value recorded (because reviews accumulate over time).

6. price_eur — FLOAT64

The average price of the book across all years it appeared.

7. bestseller — INT64

Always TRUE (0/1), since the dataset contains only bestseller books.

8. years_on_bestsellers_list — INT64

How many times (years) the book appeared on the Amazon bestseller lists between 2010–2020.



SELECT
  'Amazon' AS source,                                  -- STRING
  Book_Title AS title,                                 -- STRING
  Author AS author,                                    -- STRING
  ROUND (AVG(Rating),2) AS review,                               -- FLOAT64
  MAX(Num_Customers_Rated) AS reviews_count,           -- INT64
  NULL AS published_year,                              -- DATE (placeholder)
  ROUND (AVG(Price),2) AS price_eur,                             -- FLOAT64
  NULL AS length,                                      -- STRING (placeholder)
  NULL AS awards,                                      -- BOOL (placeholder)
  TRUE AS bestseller,                                  -- BOOL
  NULL AS classic,                                     -- BOOL (placeholder)
  NULL AS publisher,                                   -- STRING (placeholder)
  NULL AS book_series,                                 -- STRING (placeholder)
  NULL AS genre,                                       -- STRING (placeholder)
  COUNT(*) AS years_on_bestsellers_list                -- INT64
FROM `book-project-479914.cleaned_data.amazon_data-v2`
GROUP BY title, author
ORDER BY years_on_bestsellers_list DESC


  SELECT
  source,   -- STRING
  title,    -- STRING
  author,   -- STRING
  review,   -- FLOAT64
  reviews_count,   -- INT64
 published_year,   -- INT64
  price_eur,       -- FLOAT64
  CAST (length AS STRING) AS length,  -- STRING
  awards,       --  INT64
  bestseller,   -- INT64
  classic,     -- INT64
  CAST(publisher AS STRING) AS publisher,  -- STRING
  CAST(book_series AS STRING) AS book_series,   -- STRING
  CAST(genre AS STRING) AS genre,     -- STRING
  years_on_bestsellers_list    -- INT64
FROM `book-project-479914.harmonized_data.amazon_bestseller-v4`
