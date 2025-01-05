Source: <https://www.linkedin.com/posts/im-nsk_sql-activity-7265197244021112832-bto5>

## Amazon (Hard Level)

Given the users' sessions logs on a particular day, calculate how many hours each user was active that day. Note: The session starts when state=1 and ends when state=0.

🌀 Trust me, this one will surely challenge you...! Give it a try and share the output! 👇

## 𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭:

CREATE TABLE customer_state_log (cust_id VARCHAR(10),state INT,timestamp TIME);

INSERT INTO customer_state_log (cust_id, state, timestamp) VALUES('c001', 1, '07:00:00'),('c001', 0, '09:30:00'),('c001', 1, '12:00:00'),('c001', 0, '14:30:00'),('c002', 1, '08:00:00'),('c002', 0, '09:30:00'),('c002', 1, '11:00:00'),('c002', 0, '12:30:00'),('c002', 1, '15:00:00'),('c002', 0, '16:30:00'),('c003', 1, '09:00:00'),('c003', 0, '10:30:00'),('c004', 1, '10:00:00'),('c004', 0, '10:30:00'),('c004', 1, '14:00:00'),('c004', 0, '15:30:00'),('c005', 1, '10:00:00'),('c005', 0, '14:30:00'),('c005', 1, '15:30:00'),('c005', 0, '18:30:00');
