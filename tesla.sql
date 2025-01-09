DROP TABLE IF EXISTS car_launches;

CREATE TABLE car_launches (
  year INT,
  company_name VARCHAR(15),
  product_name VARCHAR(30)
);

INSERT INTO
  car_launches
VALUES
  (2019, 'Toyota', 'Avalon'),
  (2019, 'Toyota', 'Camry'),
  (2020, 'Toyota', 'Corolla'),
  (2019, 'Honda', 'Accord'),
  (2019, 'Honda', 'Passport'),
  (2019, 'Honda', 'CR-V'),
  (2020, 'Honda', 'Pilot'),
  (2019, 'Honda', 'Civic'),
  (2020, 'Chevrolet', 'Trailblazer'),
  (2020, 'Chevrolet', 'Trax'),
  (2019, 'Chevrolet', 'Traverse'),
  (2020, 'Chevrolet', 'Blazer'),
  (2019, 'Ford', 'Figo'),
  (2020, 'Ford', 'Aspire'),
  (2019, 'Ford', 'Endeavour'),
  (2020, 'Jeep', 'Wrangler');
