DROP TABLE IF EXISTS spotify_worldwide_daily_song_ranking;

DROP TABLE IF EXISTS spotify_daily_rankings_2017_us;

CREATE TABLE spotify_daily_rankings_2017_us (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  position INT,
  trackname VARCHAR(255),
  artist VARCHAR(255),
  streams INT,
  url VARCHAR(255),
  date DATETIME
);

INSERT INTO
  spotify_daily_rankings_2017_us (position, trackname, artist, streams, url, date)
VALUES
  (
    1,
    'Track A',
    'Artist 1',
    500000,
    'https://url1.com',
    '2017-01-01'
  ),
  (
    2,
    'Track B',
    'Artist 2',
    400000,
    'https://url2.com',
    '2017-01-01'
  ),
  (
    1,
    'Track A',
    'Artist 1',
    520000,
    'https://url1.com',
    '2017-01-02'
  ),
  (
    3,
    'Track C',
    'Artist 3',
    300000,
    'https://url3.com',
    '2017-01-02'
  ),
  (
    1,
    'Track D',
    'Artist 4',
    600000,
    'https://url4.com',
    '2017-01-03'
  );

CREATE TABLE spotify_worldwide_daily_song_ranking (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  position INT,
  trackname VARCHAR(255),
  artist VARCHAR(255),
  streams INT,
  url VARCHAR(255),
  date DATETIME,
  region VARCHAR(50)
);

INSERT INTO
  spotify_worldwide_daily_song_ranking (
    position,
    trackname,
    artist,
    streams,
    url,
    date,
    region
  )
VALUES
  (
    1,
    'Track A',
    'Artist 1',
    550000,
    'https://url1.com',
    '2017-01-01',
    'US'
  ),
  (
    2,
    'Track B',
    'Artist 2',
    450000,
    'https://url2.com',
    '2017-01-01',
    'US'
  ),
  (
    1,
    'Track A',
    'Artist 1',
    530000,
    'https://url1.com',
    '2017-01-02',
    'US'
  ),
  (
    1,
    'Track D',
    'Artist 4',
    610000,
    'https://url4.com',
    '2017-01-03',
    'US'
  ),
  (
    3,
    'Track C',
    'Artist 3',
    320000,
    'https://url3.com',
    '2017-01-03',
    'US'
  );

SELECT
  ust.trackname,
  count(*) AS days_in_first_position
FROM
  spotify_daily_rankings_2017_us ust
  JOIN spotify_worldwide_daily_song_ranking wt ON ust.trackname = wt.trackname
  AND ust.date = wt.date
  AND ust.position = 1 = wt.position
  AND wt.region = 'US'
GROUP BY
  ust.trackname
ORDER BY
  ust.trackname;
