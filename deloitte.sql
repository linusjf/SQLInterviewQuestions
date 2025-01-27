DROP TABLE IF EXISTS train_arrivals;

DROP TABLE IF EXISTS train_departures;

CREATE TABLE train_arrivals (
  train_id INT,
  arrival_time DATETIME
);

INSERT INTO train_arrivals
  (train_id, arrival_time)
VALUES
  (1, '2024-11-17 08:00'),
  (2, '2024-11-17 08:05'),
  (3, '2024-11-17 08:05'),
  (4, '2024-11-17 08:10'),
  (5, '2024-11-17 08:10'),
  (6, '2024-11-17 12:15'),
  (7, '2024-11-17 12:20'),
  (8, '2024-11-17 12:25'),
  (9, '2024-11-17 15:00'),
  (10, '2024-11-17 15:00'),
  (11, '2024-11-17 15:00'),
  (12, '2024-11-17 15:06'),
  (13, '2024-11-17 20:00'),
  (14, '2024-11-17 20:10');

CREATE TABLE train_departures (
  train_id INT,
  departure_time DATETIME
);

INSERT INTO train_departures
  (train_id, departure_time)
VALUES
  (1, '2024-11-17 08:15'),
  (2, '2024-11-17 08:10'),
  (3, '2024-11-17 08:20'),
  (4, '2024-11-17 08:25'),
  (5, '2024-11-17 08:20'),
  (6, '2024-11-17 13:00'),
  (7, '2024-11-17 12:25'),
  (8, '2024-11-17 12:30'),
  (9, '2024-11-17 15:05'),
  (10, '2024-11-17 15:10'),
  (11, '2024-11-17 15:15'),
  (12, '2024-11-17 15:15'),
  (13, '2024-11-17 20:15'),
  (14, '2024-11-17 20:15');

/* In the case where both trains have to be on the
platform at the same time if their arrival and departure
times match.
*/
WITH
  trainevents AS (
    SELECT
      arrival_time AS event_time,
      1 AS event_type
    FROM train_arrivals
    UNION ALL
    SELECT
      departure_time AS event_time,
      -1 AS event_type
    FROM train_departures
    ORDER BY event_time ASC, event_type DESC
  ),
  platforms AS (
    SELECT
      event_time,
      SUM(event_type) OVER (
        ORDER BY event_time ASC, event_type DESC
      ) AS platforms_needed
    FROM trainevents
  )
SELECT MAX(platforms_needed) AS platforms_needed
FROM platforms;

/* In the case where both trains do not have
to be on the platform at the same time
if their arrival and departure times match */
WITH
  trainevents AS (
    SELECT
      arrival_time AS event_time,
      1 AS event_type
    FROM train_arrivals
    UNION ALL
    SELECT
      departure_time AS event_time,
      -1 AS event_type
    FROM train_departures
    ORDER BY event_time, event_type
  ),
  platforms AS (
    SELECT
      event_time,
      SUM(event_type) OVER (
        ORDER BY event_time ASC, event_type ASC
      ) AS platforms_needed
    FROM trainevents
  )
SELECT MAX(platforms_needed) AS platforms_needed
FROM platforms;

WITH
  train_schedule AS (
    SELECT
      arrivals.train_id,
      arrivals.arrival_time,
      departures.departure_time
    FROM
      train_arrivals AS arrivals
      INNER JOIN train_departures AS departures
        ON arrivals.train_id = departures.train_id
  )
SELECT MAX(overlapping_trains) AS min_platforms_required
FROM
  (
    SELECT
      schedule.train_id,
      COUNT(*) AS overlapping_trains
    FROM
      train_schedule AS schedule
      INNER JOIN train_schedule AS sch
        ON schedule.arrival_time <= sch.departure_time
        AND schedule.departure_time >= sch.arrival_time
    GROUP BY schedule.train_id
  ) AS overlapping_counts;
