DROP TABLE IF EXISTS fact_events;

CREATE TABLE fact_events (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  time_id DATETIME,
  user_id VARCHAR(20),
  customer_id VARCHAR(50),
  client_id VARCHAR(20),
  event_type VARCHAR(50),
  event_id INT
);

INSERT INTO
  fact_events (
    time_id,
    user_id,
    customer_id,
    client_id,
    event_type,
    event_id
  )
VALUES
  (
    '2020-02-28',
    '3668-QPYBK',
    'Sendit',
    'desktop',
    'message sent',
    3
  ),
  (
    '2020-02-28',
    '7892-POOKP',
    'Connectix',
    'mobile',
    'file received',
    2
  ),
  (
    '2020-04-03',
    '9763-GRSKD',
    'Zoomit',
    'desktop',
    'video call received',
    7
  ),
  (
    '2020-04-02',
    '9763-GRSKD',
    'Connectix',
    'desktop',
    'video call received',
    7
  ),
  (
    '2020-02-06',
    '9237-HQITU',
    'Sendit',
    'desktop',
    'video call received',
    7
  ),
  (
    '2020-02-27',
    '8191-XWSZG',
    'Connectix',
    'desktop',
    'file received',
    2
  ),
  (
    '2020-04-03',
    '9237-HQITU',
    'Connectix',
    'desktop',
    'video call received',
    7
  ),
  (
    '2020-03-01',
    '9237-HQITU',
    'Connectix',
    'mobile',
    'message received',
    4
  ),
  (
    '2020-04-02',
    '4190-MFLUW',
    'Connectix',
    'mobile',
    'video call received',
    7
  ),
  (
    '2020-04-21',
    '9763-GRSKD',
    'Sendit',
    'desktop',
    'file received',
    2
  );

SELECT
  client_id,
  STRFTIME('%Y-%m', time_id) AS year_month,
  COUNT(DISTINCT user_id) AS no_of_users
FROM
  fact_events
GROUP BY
  client_id,
  year_month
ORDER BY
  client_id,
  year_month;
