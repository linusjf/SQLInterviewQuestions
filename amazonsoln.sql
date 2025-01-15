WITH
  -- Filter out returns and extract year-month
  monthly_revenue AS (
    SELECT
      STRFTIME('%Y-%m', created_at) AS year_month,
      SUM(
        CASE
          WHEN purchase_amt > 0 THEN purchase_amt
          ELSE 0
        END
      ) AS revenue
    FROM amazon_purchases
    GROUP BY STRFTIME('%Y-%m', created_at)
  ),
  -- Calculate 3-month rolling average
  rolling_average AS (
    SELECT
      year_month,
      AVG(revenue) OVER (
        ORDER BY year_month
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
      ) AS rolling_avg
    FROM monthly_revenue
  )
-- Select and order results
SELECT
  year_month,
  ROUND(rolling_avg, 2) AS rolling_avg
FROM rolling_average
ORDER BY year_month;
