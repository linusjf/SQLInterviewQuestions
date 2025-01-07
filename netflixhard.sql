DROP TABLE IF EXISTS sf_events;

CREATE TABLE sf_events (
  date DATETIME,
  account_id VARCHAR(10),
  user_id VARCHAR(10)
);

INSERT INTO
  sf_events (date, account_id, user_id)
VALUES
  ('2021-01-01', 'A1', 'U1'),
  ('2021-01-01', 'A1', 'U2'),
  ('2021-01-06', 'A1', 'U3'),
  ('2021-01-02', 'A1', 'U1'),
  ('2020-12-24', 'A1', 'U2'),
  ('2020-12-08', 'A1', 'U1'),
  ('2020-12-09', 'A1', 'U1'),
  ('2021-01-10', 'A2', 'U4'),
  ('2021-01-11', 'A2', 'U4'),
  ('2021-01-12', 'A2', 'U4'),
  ('2021-01-15', 'A2', 'U5'),
  ('2020-12-17', 'A2', 'U4'),
  ('2020-12-25', 'A3', 'U6'),
  ('2020-12-25', 'A3', 'U6'),
  ('2020-12-25', 'A3', 'U6'),
  ('2020-12-06', 'A3', 'U7'),
  ('2020-12-06', 'A3', 'U6'),
  ('2021-01-14', 'A3', 'U6'),
  ('2021-02-07', 'A1', 'U1'),
  ('2021-02-10', 'A1', 'U2'),
  ('2021-02-01', 'A2', 'U4'),
  ('2021-02-01', 'A2', 'U5'),
  ('2020-12-05', 'A1', 'U8');

WITH
  leadlags AS (
    SELECT
      user_id,
      date,
      lag(date) OVER (
        PARTITION BY
          user_id
        ORDER BY
          date
      ) AS prev_day,
      lead(date) OVER (
        PARTITION BY
          user_id
        ORDER BY
          date
      ) AS next_day
    FROM
      sf_events
  )
SELECT DISTINCT
  user_id
FROM
  leadlags
WHERE
  julianday(date) - julianday(prev_day) = 1
  AND julianday(next_day) - julianday(date) = 1;
