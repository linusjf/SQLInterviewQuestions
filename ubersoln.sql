WITH monthly_aggregate as (
   select strftime('%Y-%m', request_date) as year_month,
   SUM(distance_to_travel) as monthly_distance,
  SUM(monetary_cost) as monthly_cost
  FROM uber_request_logs
  GROUP BY year_month
),
distance_per_dollar AS (
  SELECT year_month,
  monthly_distance * 1.0 / monthly_cost AS dist_per_dollar
  FROM monthly_aggregate
  GROUP BY year_month
  ORDER BY year_month
),
naive_forecast AS (
  SELECT *,
  LAG(dist_per_dollar) OVER(ORDER BY year_month) forecast_value
        FROM distance_per_dollar
)
SELECT ROUND(SQRT(AVG(POWER(dist_per_dollar - forecast_value,2))),2) as RSME
FROM naive_forecast;
