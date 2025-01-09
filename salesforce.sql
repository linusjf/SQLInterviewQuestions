DROP TABLE IF EXISTS sales_performance;

CREATE TABLE sales_performance (
  salesperson VARCHAR(50),
  widget_sales INT,
  sales_revenue INT,
  id INTEGER PRIMARY KEY AUTOINCREMENT
);

INSERT INTO
  sales_performance (salesperson, widget_sales, sales_revenue)
VALUES
  ('Jim', 810, 40500),
  ('Bobby', 661, 33050),
  ('Samantha', 1006, 50300),
  ('Taylor', 984, 49200),
  ('Tom', 403, 20150),
  ('Pat', 715, 35750),
  ('Lisa', 1247, 62350);

SELECT SUM(sales_revenue) AS total_sales
FROM
  sales_performance
WHERE
  salesperson IN ('Samantha', 'Lisa');
