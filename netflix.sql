DROP TABLE IF EXISTS netflix_titles;

-- Create the table structure
CREATE TABLE netflix_titles (
    show_id TEXT,
    type TEXT,
    title TEXT,
    director TEXT,
    cast TEXT,
    country TEXT,
    date_added DATETIME,
    release_year INTEGER,
    rating TEXT,
    duration TEXT,
    listed_in TEXT,
    description TEXT
);

.mode csv

.import --skip 1 netflix.csv netflix_titles

update netflix_titles set listed_in = concat('[',replace(quote(listed_in),', ', ''','''),']');

update netflix_titles set listed_in = replace(listed_in,'''''','\''\''');

WITH cte(month, month_name) AS (VALUES
  ('01', 'January'), ('02', 'February'), ('03', 'March'), ('04', 'April'), ('05', 'May'), ('06', 'June'),
  ('07', 'July'), ('08', 'August'), ('09', 'September'), ('10', 'October'), ('11', 'November'), ('12', 'December')
)
SElECT SUBSTR(date_added, LENGTH(date_added) - 3, 4) || '-' || (SELECT c.month FROM cte c WHERE date_added LIKE '%' || c.month_name || '%' ) || '-' || printf('%02d', SUBSTR(date_added,LENGTH(date_added) - 7 , 2))  from netflix_titles LIMIT 15 offset 80;

WITH ct(month, month_name) AS (VALUES
  ('01', 'January'), ('02', 'February'), ('03', 'March'), ('04', 'April'), ('05', 'May'), ('06', 'June'),
  ('07', 'July'), ('08', 'August'), ('09', 'September'), ('10', 'October'), ('11', 'November'), ('12', 'December')
)
UPDATE netflix_titles
SET date_added = SUBSTR(date_added, LENGTH(date_added) - 3, 4) || '-' || (SELECT c.month FROM ct c WHERE date_added LIKE '%' || c.month_name || '%' ) || '-' || printf('%02d', SUBSTR(date_added,LENGTH(date_added) - 7 , 2));

select date_added from netflix_titles limit 15 offset 80 ;
select netflix_titles.show_id, listed_in as genre from netflix_titles where show_id = 's35';

select netflix_titles.show_id, x.value as genre from netflix_titles, json_each(listed_in) as x;

select count(*) as no_country_count from netflix_titles where country is NULL;

select *  from netflix_titles where date_added is NULL;
