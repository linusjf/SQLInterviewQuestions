WITH
  year_launches AS (
    SELECT
      company_name,
      SUM(
        CASE
          WHEN year = 2019 THEN 1
          ELSE 0
        END
      ) AS launches_19,
      SUM(
        CASE
          WHEN year = 2020 THEN 1
          ELSE 0
        END
      ) AS launches_20
    FROM
      car_launches
    WHERE
      year IN (2019, 2020)
    GROUP BY
      company_name
    ORDER BY
      company_name
  )
SELECT
  company_name,
  launches_20 - launches_19 AS net_difference
FROM
  year_launches
ORDER BY
  net_difference DESC;
