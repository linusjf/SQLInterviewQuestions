SELECT
  airbnb_hosts.nationality,
  SUM(airbnb_apartments.n_beds) AS total_beds
FROM
  airbnb_apartments
  INNER JOIN airbnb_hosts ON airbnb_apartments.host_id = airbnb_hosts.host_id
GROUP BY airbnb_hosts.nationality
ORDER BY total_beds DESC;
