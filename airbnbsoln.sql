SELECT
  nationality,
  sum(n_beds) AS total_beds
FROM
  airbnb_apartments
  JOIN airbnb_hosts USING (host_id)
GROUP BY
  nationality
ORDER BY
  total_beds DESC;
