DROP TABLE IF EXISTS employee_o;

CREATE TABLE employee_o (
  id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INT,
  gender VARCHAR(10),
  employee_title VARCHAR(50),
  department VARCHAR(50),
  salary INT,
  manager_id INT
);

INSERT INTO
  employee_o (
    id,
    first_name,
    last_name,
    age,
    gender,
    employee_title,
    department,
    salary,
    manager_id
  )
VALUES
  (
    1,
    'Alice',
    'Smith',
    45,
    'F',
    'Manager',
    'HR',
    9000,
    1
  ),
  (
    2,
    'Bob',
    'Johnson',
    34,
    'M',
    'Assistant',
    'HR',
    4500,
    1
  ),
  (
    3,
    'Charlie',
    'Williams',
    28,
    'M',
    'Coordinator',
    'HR',
    4800,
    1
  ),
  (
    4,
    'Diana',
    'Brown',
    32,
    'F',
    'Manager',
    'IT',
    12000,
    4
  ),
  (
    5,
    'Eve',
    'Jones',
    27,
    'F',
    'Analyst',
    'IT',
    7000,
    4
  ),
  (
    6,
    'Frank',
    'Garcia',
    29,
    'M',
    'Developer',
    'IT',
    7500,
    4
  ),
  (
    7,
    'Grace',
    'Miller',
    30,
    'F',
    'Manager',
    'Finance',
    10000,
    7
  ),
  (
    8,
    'Hank',
    'Davis',
    26,
    'M',
    'Analyst',
    'Finance',
    6200,
    7
  ),
  (
    9,
    'Ivy',
    'Martinez',
    31,
    'F',
    'Clerk',
    'Finance',
    5900,
    7
  ),
  (
    10,
    'John',
    'Lopez',
    36,
    'M',
    'Manager',
    'Marketing',
    11000,
    10
  ),
  (
    11,
    'Kim',
    'Gonzales',
    29,
    'F',
    'Specialist',
    'Marketing',
    6800,
    10
  ),
  (
    12,
    'Leo',
    'Wilson',
    27,
    'M',
    'Coordinator',
    'Marketing',
    6600,
    10
  );

WITH
  avg_salary AS (
    SELECT
      department,
      ROUND(
        AVG(
          CASE
            WHEN id != manager_id THEN salary
            ELSE 0
          END
        ),
        2
      ) AS avg_dept_salary
    FROM
      employee_o
    GROUP BY
      department
    ORDER BY
      department
  ),
  manager_salary AS (
    SELECT
      emps.department,
      emps.id,
      emps.salary,
      mgrs.salary AS mgr_salary
    FROM
      employee_o AS emps
      LEFT JOIN employee_o AS mgrs ON emps.manager_id = mgrs.id
    GROUP BY
      emps.department,
      emps.id
    ORDER BY
      emps.department,
      emps.id
  )
SELECT
  salary.department,
  salary.id,
  salary.salary,
  salary.mgr_salary,
  avg_sal.avg_dept_salary
FROM
  manager_salary AS salary
  INNER JOIN avg_salary AS avg_sal ON salary.department = avg_sal.department
GROUP BY
  salary.department,
  salary.id
ORDER BY
  salary.department,
  salary.id;
