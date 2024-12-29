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
  (1, '2024-01-01 00:00:00'),
  (2, '2024-01-02 00:00:00'),
  (3, '2024-01-05 00:00:00'),
  (3, '2024-01-05 00:00:00'),
  (4, '2024-01-03 00:00:00'),
  (4, '2024-01-03 00:00:00'),
  (5, '2024-01-04 00:00:00'),
  (5, '2024-01-04 00:00:00'),
  (3, '2024-01-05 00:00:00'),
  (5, '2024-01-04 00:00:00');

CREATE TABLE order_summary (
  order_id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INT,
  order_value INT,
  order_date DATETIME
);

INSERT INTO
  order_summary (user_id, order_value, order_date)
VALUES
  (1, 152, '2024-01-01 00:00:00'),
  (2, 485, '2024-01-02 00:00:00'),
  (3, 398, '2024-01-05 00:00:00'),
  (3, 320, '2024-01-05 00:00:00'),
  (4, 156, '2024-01-03 00:00:00'),
  (4, 121, '2024-01-03 00:00:00'),
  (5, 238, '2024-01-04 00:00:00'),
  (5, 70, '2024-01-04 00:00:00'),
  (3, 152, '2024-01-05 00:00:00'),
  (5, 171, '2024-01-04 00:00:00');

SELECT
  user_id,
  session_date,
  count(order_id) AS no_of_orders,
  sum(order_value) AS total_order_value
FROM
  sessions
  JOIN order_summary USING (user_id)
WHERE
  strftime('%J', session_date) = strftime('%J', order_date)
GROUP BY
  user_id,
  session_date
HAVING
  no_of_orders > 0
ORDER BY
  user_id;
