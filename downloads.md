## Microsoft (Hard Level)

Find the total number of downloads for paying and non-paying users by date. Include only records where non-paying customers have more downloads than paying customers. The output should be sorted by earliest date first and contain 3 columns date, non-paying downloads, paying downloads. 

Note: In Oracle you should use "date" when referring to date column (reserved keyword).

🔍By solving this, you'll learn how to use join, groupby and having. Give it a try and share the output!👇

## 𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭:

CREATE TABLE ms_user_dimension (user_id INTEGER PRIMARY KEYAUTOINCREMENT,acc_id INT);
INSERT INTO ms_user_dimension (acc_id) VALUES (101),(102),(103),(104),(105);

CREATE TABLE ms_acc_dimension (acc_id INT PRIMARY KEY,paying_customer VARCHAR(10));
INSERT INTO ms_acc_dimension (acc_id, paying_customer) VALUES (101, 'Yes'),(102, 'No'),(103, 'Yes'),(104, 'No'),(105, 'No');

CREATE TABLE ms_download_facts (date DATETIME,user_id INT,downloads INT);
INSERT INTO ms_download_facts (date, user_id, downloads) VALUES ('2024-10-01', 1, 10),('2024-10-01', 2, 15),('2024-10-02', 1, 8),('2024-10-02', 3, 12),('2024-10-02', 4, 20),('2024-10-03', 2, 25),('2024-10-03', 5, 18);
