DROP TABLE IF EXISTS linkedin_users;

CREATE TABLE linkedin_users (
  user_id INT,
  employer VARCHAR(255),
  position VARCHAR(255),
  start_date DATETIME,
  end_date DATETIME
);

INSERT INTO
linkedin_users (user_id, employer, position, start_date, end_date)
VALUES
(
  1,
  'Microsoft',
  'developer',
  '2020-04-13',
  '2021-11-01'
),
(1, 'Google', 'developer', '2021-11-01', null),
(
  2,
  'Google',
  'manager',
  '2021-01-01',
  '2021-01-11'
),
(2, 'Microsoft', 'manager', '2021-01-11', null),
(
  3,
  'Microsoft',
  'analyst',
  '2019-03-15',
  '2020-07-24'
),
(
  3,
  'Amazon',
  'analyst',
  '2020-08-01',
  '2020-11-01'
),
(
  3,
  'Google',
  'senior analyst',
  '2020-11-01',
  '2021-03-04'
),
(
  4,
  'Google',
  'junior developer',
  '2018-06-01',
  '2021-11-01'
),
(
  4,
  'Google',
  'senior developer',
  '2021-11-01',
  null
),
(5, 'Microsoft', 'manager', '2017-09-26', null),
(6, 'Google', 'CEO', '2015-10-02', null);

WITH
  leads AS (
    SELECT
      user_id,
      employer AS current_employer,
      lead(employer) OVER (
        PARTITION BY
          user_id
        ORDER BY
          start_date DESC
      ) AS prev_employer,
      start_date,
      end_date
    FROM
      linkedin_users
  )
SELECT user_id
FROM
  leads
WHERE
  current_employer = 'Google'
  AND prev_employer = 'Microsoft';
