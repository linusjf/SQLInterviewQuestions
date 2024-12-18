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

select netflix_titles.show_id, listed_in as genre from netflix_titles where show_id = 's35';

select netflix_titles.show_id, x.value as genre from netflix_titles, json_each(listed_in) as x;

select count(*) as no_country_count from netflix_titles where country is NULL;

select date_added from netflix_titles limit 5;
