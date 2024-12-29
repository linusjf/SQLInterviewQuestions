Source: <https://www.linkedin.com/posts/im-nsk_sql-activity-7260123802523635713-OTw0>

## Amazon, Doordash(Medium Level)

You have been asked to find the job titles of the highest-paid employees.
Your output should include the highest-paid title or multiple titles with the same salary.

By solving this, you'll learn how to use subquery and join. Give it a try and share the output!

## 𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭:

CREATE TABLE worker(worker_id INTEGER PRIMARY KEY AUTOINCREMENT,first_name VARCHAR(50),last_name VARCHAR(50),salary INT,joining_date DATETIME,department VARCHAR(50));

INSERT INTO worker(first_name, last_name, salary, joining_date, department) VALUES('John', 'Doe', 80000, '2020-01-15', 'Engineering'),('Jane', 'Smith', 120000, '2019-03-10', 'Marketing'),('Alice', 'Brown', 120000, '2021-06-21', 'Sales'),('Bob', 'Davis', 75000, '2018-04-30', 'Engineering'),('Charlie', 'Miller', 95000, '2021-01-15', 'Sales');

CREATE TABLE title(worker_ref_id INT,worker_title VARCHAR(50),affected_from DATETIME);

INSERT INTO title(worker_ref_id, worker_title, affected_from) VALUES(1, 'Engineer', '2020-01-15'),(2, 'Marketing Manager', '2019-03-10'),(3, 'Sales Manager', '2021-06-21'),(4, 'Junior Engineer', '2018-04-30'),(5, 'Senior Salesperson', '2021-01-15');
