WITH
  distinct_users AS (
    SELECT user_id AS users
    FROM
      famous
    UNION
    SELECT follower_id
    FROM
      famous
  ),
  follower_count AS (
    SELECT
      user_id AS user,
      count(follower_id) AS follower_count
    FROM
      famous
    GROUP BY
      user
  )
SELECT
  user,
  round(
    follower_count * 100.0 / (
      SELECT count(*)
      FROM
        distinct_users
    ),
    2
  ) AS fame_metric
FROM
  follower_count
ORDER BY
  fame_metric DESC;
