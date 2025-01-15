DROP TABLE IF EXISTS fact_events;

CREATE TABLE fact_events (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  time_id DATETIME,
  user_id VARCHAR(50),
  customer_id VARCHAR(50),
  client_id VARCHAR(50),
  event_type VARCHAR(50),
  event_id INT
);

INSERT INTO fact_events
  (time_id, user_id, customer_id, client_id, event_type, event_id)
VALUES
  ('2024-12-01 10:00:00', 'U1', 'C1', 'desktop', 'click', 101),
  ('2024-12-01 11:00:00', 'U2', 'C1', 'mobile', 'view', 102),
  ('2024-12-01 12:00:00', 'U3', 'C2', 'desktop', 'click', 103),
  ('2024-12-01 13:00:00', 'U1', 'C1', 'desktop', 'click', 104),
  ('2024-12-01 14:00:00', 'U2', 'C1', 'tablet', 'view', 105),
  ('2024-12-01 15:00:00', 'U4', 'C3', 'desktop', 'click', 106),
  ('2024-12-01 16:00:00', 'U3', 'C2', 'desktop', 'click', 107),
  ('2024-12-01 17:00:00', 'U5', 'C4', 'desktop', 'click', 108),
  ('2024-12-01 18:00:00', 'U6', 'C4', 'mobile', 'view', 109),
  ('2024-12-01 19:00:00', 'U7', 'C5', 'desktop', 'click', 110);

WITH
  count_users AS (
    SELECT
      customer_id,
      COUNT(DISTINCT user_id) AS users
    FROM fact_events
    WHERE client_id = 'desktop'
    GROUP BY customer_id
  )
SELECT
  customer_id,
  users
FROM count_users
WHERE
  users = (
    -- noqa:disable=RF02
    SELECT MAX(users)
    FROM count_users
  );
