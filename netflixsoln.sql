select type, count(type) as count from netflix_titles group by type order by type;
select ROUND(100.0 * count(CASE WHEN country IS NULL THEN 1 END) / count(*),2) AS pct_wo_country from netflix_titles;
