DROP TABLE IF EXISTS download_facts;

DROP TABLE IF EXISTS acc_dimension;

DROP TABLE IF EXISTS user_dimension;

CREATE TABLE user_dimension (
  user_id INTEGER PRIMARY KEY AUTOINCREMENT,
  acc_id INT
);

INSERT INTO
  user_dimension (acc_id)
VALUES
  (101),
  (102),
  (103),
  (104),
  (105);

CREATE TABLE acc_dimension (
  acc_id INT PRIMARY KEY,
  paying_customer VARCHAR(10)
);

INSERT INTO
  acc_dimension (acc_id, paying_customer)
VALUES
  (101, 'Yes'),
  (102, 'No'),
  (103, 'Yes'),
  (104, 'No'),
  (105, 'No');

CREATE TABLE download_facts (date DATETIME, user_id INT, downloads INT);

INSERT INTO
  download_facts (date, user_id, downloads)
VALUES
  ('2024-10-01', 1, 10),
  ('2024-10-01', 2, 15),
  ('2024-10-02', 1, 8),
  ('2024-10-02', 3, 12),
  ('2024-10-02', 4, 20),
  ('2024-10-03', 2, 25),
  ('2024-10-03', 5, 18);

SELECT
  date,
  sum(
    CASE
      WHEN paying_customer = 'Yes' THEN downloads
      ELSE 0
    END
  ) AS paid_downloads,
  sum(
    CASE
      WHEN paying_customer = 'No' THEN downloads
      ELSE 0
    END
  ) AS unpaid_downloads
FROM
  user_dimension
  JOIN acc_dimension USING (acc_id)
  JOIN download_facts USING (user_id)
GROUP BY
  date
HAVING
  unpaid_downloads > paid_downloads
ORDER BY
  date;
