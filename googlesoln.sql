WITH
  mutual_friends AS (
    SELECT
      friend_id
    FROM
      friends
    WHERE
      user_id = (
        SELECT
          USER_ID
        FROM
          users
        WHERE
          user_name = 'Karl'
      )
    INTERSECT
    SELECT
      friend_id
    FROM
      friends
    WHERE
      user_id = (
        SELECT
          USER_ID
        FROM
          users
        WHERE
          user_name = 'Hans'
      )
  )
SELECT
  user_id,
  user_name
FROM
  users
WHERE
  user_id IN (
    SELECT
      friend_id
    FROM
      mutual_friends
  );