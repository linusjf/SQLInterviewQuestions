Source: <https://www.linkedin.com/posts/im-nsk_sql-activity-7267372180005412864-D34->

## Twitter(Hard Level)

Find the top three distinct salaries for each department. Output the department name and the top 3 distinct salaries by each department. Order your results alphabetically by department and then by highest salary to lowest.

🔍By solving this, you'll learn how to use CTE, Group By, Having, Case. Give it a try and share the output! 👇

## 𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭

CREATE TABLE employees (id INT PRIMARY KEY AUTOINCREMENT,first_name VARCHAR(50), last_name VARCHAR(50), age INT, sex VARCHAR(1), employee_title VARCHAR(50), department VARCHAR(50), salary INT, target INT, bonus INT, city VARCHAR(50), address VARCHAR(50), manager_id INT);

INSERT INTO employees (first_name, last_name, age, sex, employee_title, department, salary, target, bonus, city, address, manager_id) VALUES ('Allen', 'Wang', 55, 'F', 'Manager', 'Management', 200000, 0, 300, 'California', '23St', 1),( 'Katty', 'Bond', 56, 'F', 'Manager', 'Management', 150000, 0, 300, 'Arizona', NULL, 1),('George', 'Joe', 50, 'M', 'Manager', 'Management', 100000, 0, 300, 'Florida', '26St', 1),('Richerd', 'Gear', 57, 'M', 'Manager', 'Management', 250000, 0, 300, 'Alabama', NULL, 1),( 'Jennifer', 'Dion', 34, 'F', 'Sales', 'Sales', 100000, 200, 150, 'Alabama', NULL, 13),('Laila', 'Mark', 26, 'F', 'Sales', 'Sales', 100000, 200, 150,  'Florida', '23St', 11),('Sarrah', 'Bicky', 31, 'F', 'Senior Sales', 'Sales', 200000, 200, 150, 'Florida', '53St', 19),('Suzan', 'Lee', 34, 'F', 'Sales', 'Sales', 130000, 200, 150,  'Florida', '56St', 19),('Mandy', 'John', 31, 'F', 'Sales', 'Sales', 130000, 200, 150,  'Florida', '45St', 19),('Mick', 'Berry', 44, 'M', 'Senior Sales', 'Sales', 220000, 200, 150, 'Florida', NULL, 11),('Shandler', 'Bing', 23, 'M', 'Auditor', 'Audit', 110000, 200, 150, 'Arizona', NULL, 11),('Jason', 'Tom', 23, 'M', 'Auditor', 'Audit', 100000, 200, 150, 'Arizona', NULL, 11),('Celine', 'Anston', 27, 'F', 'Auditor', 'Audit', 100000, 200, 150, 'Colorado', NULL, 11),('Michale', 'Jackson', 44, 'F', 'Auditor', 'Audit', 70000, 150, 150, 'Colorado', NULL, 11),('Molly', 'Sam', 28, 'F', 'Sales', 'Sales', 140000, 100, 150, 'Arizona', '24St', 13),('Nicky', 'Bat', 33, 'F', 'Sales', 'Sales', NULL, NULL, NULL, NULL, NULL, NULL);
