.mode column

.print '---BEGINNER---';

select type, count(type) as count from netflix_titles group by type order by type;
select ROUND(100.0 * count(CASE WHEN country IS NULL THEN 1 END) / count(*),2) AS pct_wo_country from netflix_titles;

.print '---INTERMEDIATE---';

select director, count(*) as no_of_titles, max(release_year) as latest_release_in from netflix_titles where director <> '' group by director order by no_of_titles desc limit 3;

WITH yearly_counts AS (
  SELECT
  CAST(strftime('%Y', date_added) AS INTEGER) as year,
  type,
  COUNT(*) AS count
  FROM netflix_titles
  WHERE year BETWEEN 2015 AND 2021
  GROUP BY year, type
)
SELECT year,
       ROUND(100.0 * TOTAL(CASE WHEN type='Movie' THEN count ELSE 0 END) / SUM(count),2) AS movie_percentage,
ROUND(100.0 * TOTAL(CASE WHEN type='TV Show' THEN count ELSE 0 END) / SUM(count), 2) AS tv_show_percentage
       FROM yearly_counts
       GROUP BY year
       ORDER by year;


.print '---ADVANCED---';

WITH genre_months AS (
  SELECT
  date(date_added,'start of month') as month,
        genres.value as genre,
  count(*) as monthly_count
  from netflix_titles, json_each(listed_in) as genres
  where date_added is not NULL
  group by month, genre
),
prev_month_cte as (
  SELECT
  genre,
  month,
  monthly_count,
  LAG(monthly_count) OVER (PARTITION BY genre ORDER by month) as prev_month_count
  FROM genre_months
),
growth_rates as (
  SELECT
  genre,
  month,
  1.0 * (monthly_count - prev_month_count) / NULLIF(prev_month_count, 0) as growth_rate
  FROM prev_month_cte
),
avg_growth_rates as (
  SELECT
  genre,
  AVG(growth_rate) as avg_growth_rate
  FROM growth_rates
  WHERE growth_rate is NOT NULL
  GROUP BY genre
)
select genre, ROUND(100.0 * avg_growth_rate, 2) as avg_growth_rate from avg_growth_rates
order by avg_growth_rate desc
limit 5;
