Source: <https://www.linkedin.com/posts/im-nsk_sql-activity-7268096348246147072-pM35>

## Netflix(Hard Level)

Find all the users who were active for 3 consecutive days or more.

😍 Definitely you are going to enjoy by solving this, you'll learn how to use CTE and windows functions. Give it a try and share the output! 👇

## 𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭

CREATE TABLE sf_events (date DATETIME,account_id VARCHAR(10),user_id VARCHAR(10));

INSERT INTO sf_events (date, account_id, user_id) VALUES('2021-01-01', 'A1', 'U1'),('2021-01-01', 'A1', 'U2'),('2021-01-06', 'A1', 'U3'),('2021-01-02', 'A1', 'U1'),('2020-12-24', 'A1', 'U2'),('2020-12-08', 'A1', 'U1'),('2020-12-09', 'A1', 'U1'),('2021-01-10', 'A2', 'U4'),('2021-01-11', 'A2', 'U4'),('2021-01-12', 'A2', 'U4'),('2021-01-15', 'A2', 'U5'),('2020-12-17', 'A2', 'U4'),('2020-12-25', 'A3', 'U6'),('2020-12-25', 'A3', 'U6'),('2020-12-25', 'A3', 'U6'),('2020-12-06', 'A3', 'U7'),('2020-12-06', 'A3', 'U6'),('2021-01-14', 'A3', 'U6'),('2021-02-07', 'A1', 'U1'),('2021-02-10', 'A1', 'U2'),('2021-02-01', 'A2', 'U4'),('2021-02-01', 'A2', 'U5'),('2020-12-05', 'A1', 'U8');


