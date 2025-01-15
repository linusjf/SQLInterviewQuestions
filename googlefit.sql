DROP TABLE IF EXISTS google_fit_location;

CREATE TABLE google_fit_location (
  user_id VARCHAR(50),
  session_id INT,
  step_id INT,
  day INT,
  latitude FLOAT,
  longitude FLOAT,
  altitude FLOAT
);

INSERT INTO google_fit_location
  (user_id, session_id, step_id, day, latitude, longitude, altitude)
VALUES
  ('user_1', 101, 1, 1, 37.7749, -122.4194, 15.0),
  ('user_1', 101, 2, 1, 37.7750, -122.4195, 15.5),
  ('user_1', 101, 3, 1, 37.7751, -122.4196, 16.0),
  ('user_1', 102, 1, 1, 34.0522, -118.2437, 20.0),
  ('user_1', 102, 2, 1, 34.0523, -118.2438, 20.5),
  ('user_2', 201, 1, 1, 40.7128, -74.0060, 5.0),
  ('user_2', 201, 2, 1, 40.7129, -74.0061, 5.5),
  ('user_2', 202, 1, 1, 51.5074, -0.1278, 10.0),
  ('user_2', 202, 2, 1, 51.5075, -0.1279, 10.5),
  ('user_3', 301, 1, 1, 48.8566, 2.3522, 25.0),
  ('user_3', 301, 2, 1, 48.8567, 2.3523, 25.5);

WITH
  sessionsteps AS (
    SELECT
      user_id,
      session_id,
      day,
      MIN(step_id) AS min_step_id,
      MAX(step_id) AS max_step_id
    FROM google_fit_location
    GROUP BY user_id, session_id, day
    HAVING COUNT(DISTINCT step_id) > 1
  ),
  sessioncoords AS (
    SELECT
      steps.user_id,
      steps.session_id,
      steps.day,
      MIN(
        CASE
          WHEN gfl.step_id = steps.min_step_id THEN gfl.latitude
        END
      ) AS min_lat,
      MIN(
        CASE
          WHEN gfl.step_id = steps.min_step_id THEN gfl.longitude
        END
      ) AS min_long,
      MAX(
        CASE
          WHEN gfl.step_id = steps.max_step_id THEN gfl.latitude
        END
      ) AS max_lat,
      MAX(
        CASE
          WHEN gfl.step_id = steps.max_step_id THEN gfl.longitude
        END
      ) AS max_long
    FROM
      sessionsteps AS steps
      INNER JOIN google_fit_location AS gfl
        ON steps.user_id = gfl.user_id
        AND steps.session_id = gfl.session_id
        AND steps.day = gfl.day
    GROUP BY steps.user_id, steps.session_id, steps.day
  ),
  distances AS (
    SELECT
      user_id,
      session_id,
      day,
      6371.0 * ACOS(
        SIN(RADIANS(min_lat)) * SIN(RADIANS(max_lat)) + COS(
          RADIANS(min_lat)
        ) * COS(RADIANS(max_lat)) * COS(RADIANS(max_long) - RADIANS(min_long))
      ) AS curved_distance,
      SQRT(
        POWER(max_lat - min_lat, 2) + POWER(max_long - min_long, 2)
      ) * 111.0 AS flat_distance
    FROM sessioncoords
  )
SELECT
  AVG(curved_distance) AS avg_curved_distance,
  AVG(flat_distance) AS avg_flat_distance,
  (AVG(curved_distance) - AVG(flat_distance)) AS differential
FROM distances;
