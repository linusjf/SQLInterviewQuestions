.mode column --noqa
DROP TABLE IF EXISTS netflix_titles;

-- Create the table structure
CREATE TABLE netflix_titles (
  show_id TEXT,
  `type` TEXT,
  title TEXT,
  director TEXT,
  `cast` TEXT,
  country TEXT,
  date_added DATETIME,
  release_year INTEGER,
  rating TEXT,
  duration TEXT,
  listed_in TEXT,
  description TEXT
);

-- noqa: disable=all
.import --csv --skip 1 netflix.csv netflix_titles
--noqa: enable=all
-- Convert listed_in contents to json array
UPDATE netflix_titles
SET
  listed_in = concat (
    '[',
    REPLACE(QUOTE(listed_in), ', ', ''','''),
    ']'
  );

-- Escape listed_in contents for json format
UPDATE netflix_titles
SET listed_in = REPLACE(listed_in, '''''', '\''\''');

-- Convert datetime field to format sqlite understands
WITH
  cte(month, month_name) AS (
    VALUES
      ('01', 'January'),
      ('02', 'February'),
      ('03', 'March'),
      ('04', 'April'),
      ('05', 'May'),
      ('06', 'June'),
      ('07', 'July'),
      ('08', 'August'),
      ('09', 'September'),
      ('10', 'October'),
      ('11', 'November'),
      ('12', 'December')
  )
UPDATE netflix_titles
SET date_added = SUBSTR(date_added, LENGTH(date_added) - 3, 4) || '-' || (
  SELECT
    c.month
  FROM cte AS c
  WHERE date_added LIKE '%' || c.month_name || '%'
) || '-' || PRINTF('%02d', SUBSTR(date_added, LENGTH(date_added) - 7, 2));

-- Test datetime conversion
SELECT
  date_added
FROM netflix_titles
LIMIT 15 OFFSET 80;

-- Check if listed_in content is double quoted
SELECT
  netflix_titles.show_id,
  listed_in AS genre
FROM netflix_titles
WHERE show_id = 's35';

-- Check if listed_in content is not malformed json
SELECT
  show_id,
  x.value AS genre
FROM
  netflix_titles,
  JSON_EACH(listed_in) AS x
WHERE show_id = 's35';

-- Check how many country columns are NULl
SELECT
  COUNT(*) AS no_country_count
FROM netflix_titles
WHERE country IS NULL;

-- Check how many date_added columns are NULl
SELECT
  show_id,
  date_added
FROM netflix_titles
WHERE date_added IS NULL;
