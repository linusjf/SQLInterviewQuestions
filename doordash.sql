DROP TABLE IF EXISTS title;

DROP TABLE IF EXISTS worker;

CREATE TABLE worker (
  worker_id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  salary INT,
  joining_date DATETIME,
  department VARCHAR(50)
);

INSERT INTO
worker (
  first_name,
  last_name,
  salary,
  joining_date,
  department
)
VALUES
('John', 'Doe', 80000, '2020-01-15', 'Engineering'),
(
  'Jane',
  'Smith',
  120000,
  '2019-03-10',
  'Marketing'
),
('Alice', 'Brown', 120000, '2021-06-21', 'Sales'),
(
  'Bob',
  'Davis',
  75000,
  '2018-04-30',
  'Engineering'
),
('Charlie', 'Miller', 95000, '2021-01-15', 'Sales');

CREATE TABLE title (
  worker_ref_id INT,
  worker_title VARCHAR(50),
  affected_from DATETIME
);

INSERT INTO
title (worker_ref_id, worker_title, affected_from)
VALUES
(1, 'Engineer', '2020-01-15'),
(2, 'Marketing Manager', '2019-03-10'),
(3, 'Sales Manager', '2021-06-21'),
(4, 'Junior Engineer', '2018-04-30'),
(5, 'Senior Salesperson', '2021-01-15');

SELECT worker_title AS title
FROM
  worker
  INNER JOIN title ON worker.worker_id = title.worker_ref_id
WHERE
  salary = (
    SELECT max(salary)
    FROM
      worker
  )
ORDER BY
  title;
