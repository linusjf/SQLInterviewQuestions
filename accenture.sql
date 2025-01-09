DROP TABLE IF EXISTS marketing_campaign;

CREATE TABLE marketing_campaign (
  user_id INT,
  created_at DATETIME,
  product_id INT,
  quantity INT,
  price INT
);

INSERT INTO
  marketing_campaign (user_id, created_at, product_id, quantity, price)
VALUES
  (1, '2020-01-01', 101, 25, 200),
  (2, '2020-01-01', 102, 5, 150),
  (3, '2020-01-02', 103, 15, 300),
  (4, '2020-01-03', 101, 10, 200),
  (5, '2020-01-04', 102, 22, 150),
  (6, '2020-01-05', 104, 8, 120),
  (7, '2020-01-06', 105, 18, 250),
  (8, '2020-01-07', 101, 30, 200),
  (9, '2020-01-08', 103, 20, 300),
  (10, '2020-01-09', 104, 9, 120);

SELECT
  product_id,
  SUM(quantity) AS units_sold,
  CASE
    WHEN SUM(quantity) >= 30 THEN 'Outstanding'
    WHEN SUM(quantity) BETWEEN 20 AND 29 THEN 'Satisfactory'
    WHEN SUM(quantity) BETWEEN 10 AND 19 THEN 'Unsatisfactory'
    ELSE 'Poor'
  END AS ad_performance
FROM
  marketing_campaign
GROUP BY
  product_id
ORDER BY
  units_sold DESC;
