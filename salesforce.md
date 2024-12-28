Source: <https://www.linkedin.com/posts/im-nsk_sql-activity-7258311907248349184-DyU_>

## Amazon, Salesforce (Basic Level)

What is the total sales revenue of Samantha and Lisa?

Just wanted to point out that even major companies like Amazon ask questions this basic— so it's worth giving it a try! and share the output!

## 𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭:

CREATE TABLE sales_performance (salesperson VARCHAR(50),widget_sales INT,sales_revenue INT,id INTEGER PRIMARY KEY AUTOINCREMENT);

INSERT INTO sales_performance (salesperson, widget_sales, sales_revenue) VALUES('Jim', 810, 40500),('Bobby', 661, 33050),('Samantha', 1006, 50300),('Taylor', 984, 49200),('Tom', 403, 20150),('Pat', 715, 35750),('Lisa', 1247, 62350);
