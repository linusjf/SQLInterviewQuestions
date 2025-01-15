WITH
  weekofyear AS (
    SELECT
      STRFTIME('%W', purchase_date) AS week_of_year,
      amount_spent
    FROM user_purchases
    WHERE
      day_name = 'Friday'
      AND CAST(STRFTIME('%m', purchase_date) AS INT) IN (1, 2, 3)
  )
SELECT
  week_of_year,
  AVG(amount_spent) AS avg_weekly_spend
FROM weekofyear
GROUP BY week_of_year
ORDER BY week_of_year;
