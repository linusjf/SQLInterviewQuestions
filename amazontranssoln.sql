WITH
  monthly_revenue AS (
    SELECT
      STRFTIME('%Y-%m', created_at) AS year_month,
      TOTAL(value) AS revenue
    FROM
      sf_transactions
    GROUP BY
      year_month
    ORDER BY
      year_month
  ),
  prev_month_revenue AS (
    SELECT
      *,
      LAG(revenue) OVER (
        ORDER BY
          year_month
      ) AS prev_month_revenue
    FROM
      monthly_revenue
  )
SELECT
  year_month,
  ROUND(100.0 * revenue / prev_month_revenue, 2) AS pct_change
FROM
  prev_month_revenue
WHERE
  pct_change IS NOT NULL;
