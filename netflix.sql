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

-- Convert listed_in contents to json array
update netflix_titles set listed_in = concat('[',replace(quote(listed_in),', ', ''','''),']');

-- Escape listed_in contents for json format
update netflix_titles set listed_in = replace(listed_in,'''''','\''\''');

-- Convert datetime field to format sqlite understands
WITH ct(month, month_name) AS (VALUES
  ('01', 'January'), ('02', 'February'), ('03', 'March'), ('04', 'April'), ('05', 'May'), ('06', 'June'),
  ('07', 'July'), ('08', 'August'), ('09', 'September'), ('10', 'October'), ('11', 'November'), ('12', 'December')
)
UPDATE netflix_titles
SET date_added = SUBSTR(date_added, LENGTH(date_added) - 3, 4) || '-' || (SELECT c.month FROM ct c WHERE date_added LIKE '%' || c.month_name || '%' ) || '-' || printf('%02d', SUBSTR(date_added,LENGTH(date_added) - 7 , 2));

-- Test datetime conversion
select date_added from netflix_titles limit 15 offset 80 ;

-- Check if listed_in content is double quoted
select netflix_titles.show_id, listed_in as genre from netflix_titles where show_id = 's35';

-- Check if listed_in content is not malformed json
select netflix_titles.show_id, x.value as genre from netflix_titles, json_each(listed_in) as x;

-- Check how many country columns are NULl
select count(*) as no_country_count from netflix_titles where country is NULL;

-- Check how many date_added columns are NULl
select *  from netflix_titles where date_added is NULL;
