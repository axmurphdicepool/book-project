SELECT 
  *
  ,CASE
    WHEN published_year >= 1600 AND published_year <= 1699 THEN '1600s'
    WHEN published_year >= 1700 AND published_year <= 1799 THEN '1900s'
    WHEN published_year >= 1800 AND published_year <= 1899 THEN '1900s'
    WHEN published_year >= 1900 AND published_year <= 1910 THEN '1900s'
    WHEN published_year >= 1911 AND published_year <= 1920 THEN '1910s'
    WHEN published_year >= 1921 AND published_year <= 1930 THEN '1920s'
    WHEN published_year >= 1931 AND published_year <= 1940 THEN '1930s'
    WHEN published_year >= 1941 AND published_year <= 1950 THEN '1940s'
    WHEN published_year >= 1951 AND published_year <= 1960 THEN '1950s'
    WHEN published_year >= 1961 AND published_year <= 1970 THEN '1960s'
    WHEN published_year >= 1971 AND published_year <= 1980 THEN '1970s'
    WHEN published_year >= 1981 AND published_year <= 1990 THEN '1980s'
    WHEN published_year >= 1991 AND published_year <= 2000 THEN '1990s'
    WHEN published_year >= 2001 AND published_year <= 2010 THEN '2000s'
    WHEN published_year >= 2011 AND published_year <= 2020 THEN '2010s'
    WHEN published_year >= 2021 THEN '2020s'
  END AS publication_decade
FROM `book-project-479914.harmonized_data.maybe_final_concat` 
WHERE published_year IS NOT NULL
