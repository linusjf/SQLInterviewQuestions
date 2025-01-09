DROP TABLE IF EXISTS order_summary;

DROP TABLE IF EXISTS sessions;

CREATE TABLE sessions (
  session_id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INT,
  session_date DATETIME
);

INSERT INTO
sessions (user_id, session_date)
VALUES
(1, '2024-01-01'),
(2, '2024-01-02'),
(3, '2024-01-05'),
(3, '2024-01-05'),
(4, '2024-01-03'),
(4, '2024-01-03'),
(5, '2024-01-04'),
(5, '2024-01-04'),
(3, '2024-01-05'),
(5, '2024-01-04');

CREATE TABLE order_summary (
  order_id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INT,
  order_value INT,
  order_date DATETIME
);

INSERT INTO
order_summary (user_id, order_value, order_date)
VALUES
(1, 152, '2024-01-01'),
(2, 485, '2024-01-02'),
(3, 398, '2024-01-05'),
(3, 320, '2024-01-05'),
(4, 156, '2024-01-03'),
(4, 121, '2024-01-03'),
(5, 238, '2024-01-04'),
(5, 70, '2024-01-04'),
(3, 152, '2024-01-05'),
(5, 171, '2024-01-04');

WITH
  grouped_orders AS (
    SELECT
      user_id,
      order_date,
      count(order_id) AS no_of_orders,
      sum(order_value) AS total_order_value
    FROM
      order_summary
    GROUP BY
      user_id,
      order_date
    ORDER BY
      user_id,
      order_date
  )
SELECT
  user_id,
  session_date,
  no_of_orders,
  total_order_value
FROM
  grouped_orders
  INNER JOIN sessions ON grouped_orders.user_id = sessions.user_id
WHERE
  session_date = order_date
GROUP BY
  user_id,
  session_date
ORDER BY
  user_id,
  session_date;
