select
'Kindle' as source,
title,
author,
review,
reviews_count,
EXTRACT(YEAR FROM publishedDate) AS published_year,
price as price_eur,
'' as length,
null as awards,
isBestSeller as bestseller,
null as classic,
'' as publisher,
'' as book_series,
category_name as genre,
null as years_on_bestseller_list
from
`trial_and_error.kindle`