DROP TABLE IF EXISTS transactions;

DROP TABLE IF EXISTS signups;

CREATE TABLE signups (
  signup_id INTEGER PRIMARY KEY AUTOINCREMENT,
  signup_start_date DATETIME,
  signup_stop_date DATETIME,
  plan_id INT,
  location VARCHAR(100)
);

INSERT INTO signups
  (signup_start_date, signup_stop_date, plan_id, location)
VALUES
  ('2020-01-01 10:00:00', '2020-01-01 12:00:00', 101, 'New York'),
  ('2020-01-02 11:00:00', '2020-01-02 13:00:00', 102, 'Los Angeles'),
  ('2020-01-03 10:00:00', '2020-01-03 14:00:00', 103, 'Chicago'),
  ('2020-01-04 09:00:00', '2020-01-04 10:30:00', 101, 'San Francisco'),
  ('2020-01-05 08:00:00', '2020-01-05 11:00:00', 102, 'New York');

CREATE TABLE transactions (
  transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
  signup_id INT,
  transaction_start_date DATETIME,
  amt FLOAT,
  FOREIGN KEY (signup_id) REFERENCES signups (signup_id)
);

INSERT INTO transactions
  (signup_id, transaction_start_date, amt)
VALUES
  (1, '2020-01-01 10:30:00', 50.00),
  (1, '2020-01-01 11:00:00', 30.00),
  (2, '2020-01-02 11:30:00', 100.00),
  (2, '2020-01-02 12:00:00', 75.00),
  (3, '2020-01-03 10:30:00', 120.00),
  (4, '2020-01-04 09:15:00', 80.00),
  (5, '2020-01-05 08:30:00', 90.00);

WITH
  avg_signups AS (
    SELECT
      location,
      AVG(
        STRFTIME('%s', signup_stop_date) - STRFTIME('%s', signup_start_date)
      ) / 60.0 AS avg_signup_duration_mins
    FROM signups
    GROUP BY location
  ),
  avg_amts AS (
    SELECT
      signups.location,
      ROUND(AVG(transactions.amt), 2) AS avg_amt
    FROM
      transactions
      INNER JOIN signups ON transactions.signup_id = signups.signup_id
    GROUP BY signups.location
  )
SELECT
  avg_amts.location,
  avg_signups.avg_signup_duration_mins,
  avg_amts.avg_amt,
  ROUND(avg_amts.avg_amt / avg_signups.avg_signup_duration_mins, 2) AS ratio
FROM
  avg_signups
  INNER JOIN avg_amts ON avg_signups.location = avg_amts.location
ORDER BY ratio DESC;
