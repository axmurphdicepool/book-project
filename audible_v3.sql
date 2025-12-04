Column Documentation:

1. source — STRING

Always "Audible". Indicates the data source.

2. title — STRING

3. author — STRING

4. review — FLOAT64

The audiobook’s average star rating (rounded to two decimals).

5. reviews_count — INT64

Total number of customer ratings recorded on Audible.

6. published_year — DATE

7. price_eur — FLOAT64

8. length — INT64 / FLOAT64

The duration of the audiobook in minutes.


SELECT
  'Audible' AS source,                     -- STRING
  name AS title,                           -- STRING
  author AS author,                        -- STRING
  ROUND(stars, 2) AS review,               -- FLOAT64
  nb_ratings AS reviews_count,             -- INT64
  DATE(release_date) AS published_year,    -- DATE (or keep full release date)
  ROUND(price_euros, 2) AS price_eur,      -- FLOAT64
  duration_mins AS length,                 -- INT64/FLOAT64: duration in minutes
  NULL AS awards,                          -- BOOL (placeholder)
  NULL AS bestseller,                      -- BOOL (placeholder)
  NULL AS classic,                         -- BOOL (placeholder)
  NULL AS publisher,                       -- STRING (placeholder)
  NULL AS book_series,                     -- STRING (placeholder)
  NULL AS genre,                           -- STRING (placeholder)
  NULL AS years_on_bestsellers_list        -- INT64 (not used for Audible)
FROM `book-project-479914.cleaned_data.audio_data-v2`