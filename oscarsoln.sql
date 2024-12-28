WITH
  winners AS (
    SELECT
      nominee,
      count(*) AS winning_count
    FROM
      oscar_nominees
    WHERE
      winner = 1
    GROUP BY
      nominee
    ORDER BY
      winning_count DESC
  )
SELECT
  top_genre AS genre
FROM
  nominee_information ni
  JOIN winners w ON ni.name = w.nominee
ORDER BY
  ni.name ASC
LIMIT
  1;
