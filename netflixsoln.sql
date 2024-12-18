select '---BEGINNER---' from netflix_titles LIMIT 1;

select type, count(type) as count from netflix_titles group by type order by type;
select ROUND(100.0 * count(CASE WHEN country IS NULL THEN 1 END) / count(*),2) AS pct_wo_country from netflix_titles;

select '---INTERMEDIATE---' from netflix_titles LIMIT 1;

select director, count(*) as no_of_titles, max(release_year) as latest_release_in from netflix_titles group by director order by no_of_titles desc limit 3;

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
