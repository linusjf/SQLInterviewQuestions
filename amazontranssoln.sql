WITH monthly_revenue AS (
  SELECT strftime('%Y-%m', created_at) as year_month,
  TOTAL(value) as revenue
  FROM sf_transactions
  GROUP BY year_month
  ORDER BY year_month
),
prev_month_revenue as (
SELECT *,
       LAG(revenue) OVER(ORDER BY year_month) prev_month_revenue
       FROM monthly_revenue
)
SELECT year_month,
       ROUND(100.0 * revenue / prev_month_revenue, 2) AS pct_change
      FROM prev_month_revenue
      WHERE pct_change IS NOT NULL;
