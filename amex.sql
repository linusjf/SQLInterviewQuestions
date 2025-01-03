DROP TABLE IF EXISTS card_orders;

DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  city VARCHAR(100),
  address VARCHAR(200),
  phone_number VARCHAR(20)
);

INSERT INTO
  customers (
    first_name,
    last_name,
    city,
    address,
    phone_number
  )
VALUES
  (
    'Jill',
    'Doe',
    'New York',
    '123 Main St',
    '555-1234'
  ),
  (
    'Henry',
    'Smith',
    'Los Angeles',
    '456 Oak Ave',
    '555-5678'
  ),
  (
    'William',
    'Johnson',
    'Chicago',
    '789 Pine Rd',
    '555-8765'
  ),
  (
    'Emma',
    'Daniel',
    'Houston',
    '321 Maple Dr',
    '555-4321'
  ),
  (
    'Charlie',
    'Davis',
    'Phoenix',
    '654 Elm St',
    '555-6789'
  );

CREATE TABLE card_orders (
  order_id INTEGER PRIMARY KEY AUTOINCREMENT,
  cust_id INT,
  order_date DATETIME,
  order_details VARCHAR(255),
  total_order_cost INT,
  FOREIGN KEY (cust_id) REFERENCES CUSTOMERS (ID)
);

INSERT INTO
  card_orders (
    cust_id,
    order_date,
    order_details,
    total_order_cost
  )
VALUES
  (1, '2024-11-01 10:00:00', 'Electronics', 200),
  (2, '2024-11-02 11:30:00', 'Groceries', 150),
  (1, '2024-11-03 15:45:00', 'Clothing', 120),
  (3, '2024-11-04 09:10:00', 'Books', 90),
  (3, '2024-11-08 10:20:00', 'Groceries', 130),
  (1, '2024-11-09 12:00:00', 'Books', 180),
  (4, '2024-11-10 11:15:00', 'Electronics', 200),
  (5, '2024-11-11 14:45:00', 'Furniture', 150),
  (2, '2024-11-12 09:30:00', 'Furniture', 180);

SELECT
  id,
  first_name,
  last_name,
  sum(total_order_cost) AS total_transaction_amt
FROM
  customers
  JOIN card_orders ON customers.id = card_orders.cust_id
GROUP BY
  id
ORDER BY
  total_transaction_amt DESC
LIMIT
  1
OFFSET
  2;

WITH
  ranks AS (
    SELECT
      id,
      first_name,
      last_name,
      sum(total_order_cost) AS total_transaction_amt,
      dense_rank() OVER (
        ORDER BY
          sum(total_order_cost) DESC
      ) AS rank
    FROM
      customers
      JOIN card_orders ON customers.id = card_orders.cust_id
    GROUP BY
      id
    ORDER BY
      rank
  )
SELECT
  id,
  first_name,
  last_name
FROM
  ranks
WHERE
  rank = 3;

SELECT
  id,
  first_name,
  last_name,
  sum(total_order_cost) AS total_transaction_amt,
  dense_rank() OVER (
    ORDER BY
      sum(total_order_cost) DESC
  ) AS rank
FROM
  customers
  JOIN card_orders ON customers.id = card_orders.cust_id
GROUP BY
  id
ORDER BY
  rank
LIMIT
  1
OFFSET
  2;
