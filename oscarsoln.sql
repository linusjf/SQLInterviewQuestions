WITH
  winners AS (
    SELECT
      nominee,
      COUNT(*) AS winning_count
    FROM
      oscar_nominees
    WHERE
      winner = 1
    GROUP BY
      nominee
    ORDER BY
      winning_count DESC
  )
SELECT top_genre AS genre
FROM
  nominee_information AS nom_info
  INNER JOIN winners ON nom_info.name = winners.nominee
ORDER BY
  nom_info.name ASC
LIMIT
  1;
