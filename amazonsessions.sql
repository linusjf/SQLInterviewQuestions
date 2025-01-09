DROP TABLE IF EXISTS customer_state_log;

CREATE TABLE customer_state_log (cust_id VARCHAR(10), state INT, timestamp TIME);

INSERT INTO
  customer_state_log (cust_id, state, timestamp)
VALUES
  ('c001', 1, '07:00:00'),
  ('c001', 0, '09:30:00'),
  ('c001', 1, '12:00:00'),
  ('c001', 0, '14:30:00'),
  ('c002', 1, '08:00:00'),
  ('c002', 0, '09:30:00'),
  ('c002', 1, '11:00:00'),
  ('c002', 0, '12:30:00'),
  ('c002', 1, '15:00:00'),
  ('c002', 0, '16:30:00'),
  ('c003', 1, '09:00:00'),
  ('c003', 0, '10:30:00'),
  ('c004', 1, '10:00:00'),
  ('c004', 0, '10:30:00'),
  ('c004', 1, '14:00:00'),
  ('c004', 0, '15:30:00'),
  ('c005', 1, '10:00:00'),
  ('c005', 0, '14:30:00'),
  ('c005', 1, '15:30:00'),
  ('c005', 0, '18:30:00');

WITH
  startend AS (
    SELECT
      cust_id,
      state,
      LAG(timestamp) OVER (
        PARTITION BY
          cust_id
        ORDER BY
          timestamp
      ) AS session_start,
      timestamp AS session_end
    FROM
      customer_state_log
  ),
  filtered AS (
    SELECT
      cust_id,
      session_start,
      session_end
    FROM
      startend
    WHERE
      state = 0
  ),
  differences AS (
    SELECT
      cust_id,
      STRFTIME('%s', session_end) - STRFTIME('%s', session_start) AS seconds_in_session
    FROM
      filtered
  )
SELECT
  cust_id,
  TIME(SUM(seconds_in_session), 'unixepoch') AS user_hours
FROM
  differences
GROUP BY
  cust_id;
