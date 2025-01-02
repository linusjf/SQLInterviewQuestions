drop table if exists download_facts;
drop table if exists acc_dimension;
drop table if exists user_dimension;

CREATE TABLE user_dimension (user_id INTEGER PRIMARY KEY AUTOINCREMENT,acc_id INT);
INSERT INTO user_dimension (acc_id) VALUES (101),(102),(103),(104),(105);

CREATE TABLE acc_dimension (acc_id INT PRIMARY KEY,paying_customer VARCHAR(10));
INSERT INTO acc_dimension (acc_id, paying_customer) VALUES (101, 'Yes'),(102, 'No'),(103, 'Yes'),(104, 'No'),(105, 'No');

CREATE TABLE download_facts (date DATETIME,user_id INT,downloads INT);
INSERT INTO download_facts (date, user_id, downloads) VALUES ('2024-10-01', 1, 10),('2024-10-01', 2, 15),('2024-10-02', 1, 8),('2024-10-02', 3, 12),('2024-10-02', 4, 20),('2024-10-03', 2, 25),('2024-10-03', 5, 18);

select date,
       sum(case when paying_customer = 'Yes' then downloads else 0 end) as paid_downloads,
       sum(case when paying_customer = 'No' then downloads else 0 end) as unpaid_downloads
from user_dimension
  join acc_dimension using(acc_id)
  join download_facts using(user_id)
  group by date
  having unpaid_downloads > paid_downloads
  order by date;
