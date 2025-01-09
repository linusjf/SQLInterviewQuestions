DROP TABLE IF EXISTS airbnd_search_details;

CREATE TABLE airbnb_search_details (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  price FLOAT,
  property_type VARCHAR(100),
  room_type VARCHAR(100),
  amenities VARCHAR(5000),
  accommodates INT,
  bathrooms INT,
  bed_type VARCHAR(50),
  cancellation_policy VARCHAR(50),
  cleaning_fee BIT,
  city VARCHAR(100),
  host_identity_verified VARCHAR(10),
  host_response_rate VARCHAR(10),
  host_since DATETIME,
  neighbourhood VARCHAR(100),
  number_of_reviews INT,
  review_scores_rating FLOAT,
  zipcode INT,
  bedrooms INT,
  beds INT
);

INSERT INTO
airbnb_search_details (
  price,
  property_type,
  room_type,
  amenities,
  accommodates,
  bathrooms,
  bed_type,
  cancellation_policy,
  cleaning_fee,
  city,
  host_identity_verified,
  host_response_rate,
  host_since,
  neighbourhood,
  number_of_reviews,
  review_scores_rating,
  zipcode,
  bedrooms,
  beds
)
VALUES
(
  100,
  'Apartment',
  'Entire home/apt',
  'WiFi, Kitchen',
  2,
  1,
  'Real Bed',
  'Flexible',
  1,
  'New York',
  'Yes',
  '90%',
  '2019-01-15',
  'Manhattan',
  120,
  4.8,
  10001,
  1,
  1
),
(
  75,
  'House',
  'Private room',
  'WiFi, Parking',
  3,
  1,
  'Queen Bed',
  'Moderate',
  0,
  'Los Angeles',
  'Yes',
  '80%',
  '2018-06-22',
  'Hollywood',
  80,
  4.5,
  90001,
  2,
  1
),
(
  50,
  'Shared Room',
  'Shared room',
  'WiFi',
  1,
  1,
  'Single Bed',
  'Strict',
  0,
  'Chicago',
  'No',
  '70%',
  '2019-03-10',
  'Lincoln Park',
  40,
  3.8,
  60614,
  1,
  1
),
(
  200,
  'Villa',
  'Entire home/apt',
  'Pool, WiFi',
  6,
  3,
  'King Bed',
  'Flexible',
  1,
  'Miami',
  'Yes',
  '95%',
  '2020-07-05',
  'Miami Beach',
  300,
  4.9,
  33139,
  3,
  4
),
(
  120,
  'Apartment',
  'Entire home/apt',
  'WiFi, Kitchen, Parking',
  4,
  2,
  'Double Bed',
  'Moderate',
  1,
  'San Francisco',
  'Yes',
  '85%',
  '2021-09-18',
  'Downtown',
  150,
  4.7,
  94102,
  2,
  2
),
(
  80,
  'Apartment',
  'Private room',
  'WiFi',
  2,
  1,
  'Queen Bed',
  'Strict',
  0,
  'Austin',
  'No',
  '75%',
  '2020-11-22',
  'Downtown',
  100,
  4.4,
  78701,
  1,
  1
),
(
  150,
  'House',
  'Entire home/apt',
  'WiFi, Kitchen',
  5,
  2,
  'Queen Bed',
  'Flexible',
  1,
  'Seattle',
  'Yes',
  '90%',
  '2019-05-30',
  'Capitol Hill',
  200,
  4.6,
  98102,
  2,
  3
),
(
  60,
  'Apartment',
  'Shared room',
  'WiFi',
  1,
  1,
  'Single Bed',
  'Moderate',
  0,
  'Boston',
  'Yes',
  '80%',
  '2018-04-18',
  'Beacon Hill',
  50,
  4.2,
  02108,
  1,
  1
),
(
  90,
  'House',
  'Private room',
  'WiFi, Parking',
  3,
  2,
  'King Bed',
  'Strict',
  1,
  'Denver',
  'No',
  '85%',
  '2021-02-10',
  'Downtown',
  75,
  4.0,
  80202,
  1,
  2
),
(
  250,
  'Villa',
  'Entire home/apt',
  'Pool, WiFi, Kitchen',
  8,
  4,
  'King Bed',
  'Flexible',
  1,
  'Las Vegas',
  'Yes',
  '95%',
  '2022-06-15',
  'The Strip',
  400,
  4.9,
  89109,
  4,
  5
);

WITH
  select_by_years AS (
    SELECT
      strftime('%Y', host_since) AS year,
      count(id) AS no_registered
    FROM
      airbnb_search_details
    GROUP BY
      year
    ORDER BY
      year
  ),
  calc_lag AS (
    SELECT
      year,
      no_registered AS this_year_regs,
      lag(no_registered) OVER (
        ORDER BY
          year
      ) AS last_year_regs
    FROM
      select_by_years
  )
SELECT
  year,
  this_year_regs,
  last_year_regs,
  round(100.0 * this_year_regs / last_year_regs, 2) || '%' AS year_on_year_growth
FROM
  calc_lag
WHERE
  last_year_regs IS NOT null
ORDER BY
  year;
