/* sql-formatter-disable */
-- noqa: disable=all
.mode column
.print '---BEGINNER---';
/* sql-formatter-enable */
-- noqa: enable=all
SELECT
  type,
  COUNT(type) AS count
FROM netflix_titles
GROUP BY type
ORDER BY type;

SELECT
  ROUND(
    100.0 * COUNT(
      CASE
        WHEN country IS NULL THEN 1
      END
    ) / COUNT(*),
    2
  ) AS pct_wo_country
FROM netflix_titles;

/* sql-formatter-disable */
-- noqa: disable=all
.print '---INTERMEDIATE---';
-- noqa: enable=all
/* sql-formatter-enable */
SELECT
  director,
  COUNT(*) AS no_of_titles,
  MAX(release_year) AS latest_release_in
FROM netflix_titles
WHERE director != ''
GROUP BY director
ORDER BY no_of_titles DESC
LIMIT 3;

WITH
  yearly_counts AS (
    SELECT
      CAST(STRFTIME('%Y', date_added) AS INTEGER) AS year,
      type,
      COUNT(*) AS count
    FROM netflix_titles
    WHERE year BETWEEN 2015 AND 2021
    GROUP BY year, type
  )
SELECT
  year,
  ROUND(
    100.0 * TOTAL(
      CASE
        WHEN type = 'Movie' THEN count
        ELSE 0
      END
    ) / SUM(count),
    2
  ) AS movie_percentage,
  ROUND(
    100.0 * TOTAL(
      CASE
        WHEN type = 'TV Show' THEN count
        ELSE 0
      END
    ) / SUM(count),
    2
  ) AS tv_show_percentage
FROM yearly_counts
GROUP BY year
ORDER BY year;

/* sql-formatter-disable */
-- noqa: disable=all
.print '---ADVANCED---';
-- noqa: enable=all
/* sql-formatter-enable */
WITH
  genre_months AS (
    SELECT
      DATE(date_added, 'start of month') AS month,
      genres.value AS genre,
      COUNT(*) AS monthly_count
    FROM
      netflix_titles,
      JSON_EACH(listed_in) AS genres
    WHERE date_added IS NOT NULL
    GROUP BY month, genre
  ),
  prev_month_cte AS (
    SELECT
      genre,
      month,
      monthly_count,
      LAG(monthly_count) OVER (
        PARTITION BY genre
        ORDER BY month
      ) AS prev_month_count
    FROM genre_months
  ),
  growth_rates AS (
    SELECT
      genre,
      month,
      1.0 * (monthly_count - prev_month_count) / NULLIF(
        prev_month_count,
        0
      ) AS growth_rate
    FROM prev_month_cte
  ),
  avg_growth_rates AS (
    SELECT
      genre,
      AVG(growth_rate) AS avg_growth_rate
    FROM growth_rates
    WHERE growth_rate IS NOT NULL
    GROUP BY genre
  )
SELECT
  genre,
  ROUND(100.0 * avg_growth_rate, 2) AS avg_growth_rate
FROM avg_growth_rates
ORDER BY avg_growth_rate DESC
LIMIT 5;
