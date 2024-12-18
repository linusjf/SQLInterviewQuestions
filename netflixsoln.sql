select '---BEGINNER---' from netflix_titles LIMIT 1;

select type, count(type) as count from netflix_titles group by type order by type;
select ROUND(100.0 * count(CASE WHEN country IS NULL THEN 1 END) / count(*),2) AS pct_wo_country from netflix_titles;

select '---INTERMEDIATE---' from netflix_titles LIMIT 1;

select director, count(*) as no_of_titles, max(release_year) as latest_release_in from netflix_titles group by director order by no_of_titles desc limit 3;
