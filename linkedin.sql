DROP TABLE IF EXISTS db_employee;

DROP TABLE IF EXISTS db_dept;

CREATE TABLE db_dept (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  department VARCHAR(50)
);

INSERT INTO
  db_dept (department)
VALUES
  ('engineering'),
  ('human resource'),
  ('operation'),
  ('marketing');

CREATE TABLE db_employee (
  id INT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  salary INT,
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES db_dept (id)
);

INSERT INTO
  db_employee (id, first_name, last_name, salary, department_id)
VALUES
  (10306, 'Ashley', 'Li', 28516, 4),
  (10307, 'Joseph', 'Solomon', 19945, 1),
  (10311, 'Melissa', 'Holmes', 33575, 1),
  (10316, 'Beth', 'Torres', 34902, 1),
  (10317, 'Pamela', 'Rodriguez', 48187, 4),
  (10320, 'Gregory', 'Cook', 22681, 4),
  (10324, 'William', 'Brewer', 15947, 1),
  (10329, 'Christopher', 'Ramos', 37710, 4),
  (10333, 'Jennifer', 'Blankenship', 13433, 4),
  (10339, 'Robert', 'Mills', 13188, 1);

SELECT
  ABS(
    MAX(
      CASE
        WHEN db_dept.department = 'marketing' THEN db_employee.salary
      END
    ) - MAX(
      CASE
        WHEN db_dept.department = 'engineering' THEN db_employee.salary
      END
    )
  ) AS salary_difference
FROM
  db_employee
  INNER JOIN db_dept ON db_employee.department_id = db_dept.id;
