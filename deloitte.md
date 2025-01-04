Source: <https://www.linkedin.com/posts/im-nsk_sql-activity-7264110070248947713-t3Vn>

## GoldmanSachs, Deloitte(Hard Level)

You are given a day worth of scheduled departure and arrival times of trains at one train station. One platform can only accommodate one train from the beginning of the minute it's scheduled to arrive until the end of the minute it's scheduled to depart. Find the minimum number of platforms necessary to accommodate the entire scheduled traffic.

🌀 Trust me, this one will seriously twist your brain! Give it a try and share the output! 👇

## 𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭:

CREATE TABLE train_arrivals (train_id INT, arrival_time DATETIME);

INSERT INTO train_arrivals (train_id, arrival_time) VALUES(1, '2024-11-17 08:00'),(2, '2024-11-17 08:05'),(3, '2024-11-17 08:05'),(4, '2024-11-17 08:10'),(5, '2024-11-17 08:10'),(6, '2024-11-17 12:15'),(7, '2024-11-17 12:20'),(8, '2024-11-17 12:25'),(9, '2024-11-17 15:00'),(10, '2024-11-17 15:00'),(11, '2024-11-17 15:00'),(12, '2024-11-17 15:06'),(13, '2024-11-17 20:00'),(14, '2024-11-17 20:10');

CREATE TABLE train_departures (train_id INT, departure_time DATETIME);

INSERT INTO train_departures (train_id, departure_time) VALUES(1, '2024-11-17 08:15'),(2, '2024-11-17 08:10'),(3, '2024-11-17 08:20'),(4, '2024-11-17 08:25'),(5, '2024-11-17 08:20'),(6, '2024-11-17 13:00'),(7, '2024-11-17 12:25'),(8, '2024-11-17 12:30'),(9, '2024-11-17 15:05'),(10, '2024-11-17 15:10'),(11, '2024-11-17 15:15'),(12, '2024-11-17 15:15'),(13, '2024-11-17 20:15'),(14, '2024-11-17 20:15');
-----------

I have provided an explanation and query, but I encourage you to try solving it first. Later, you can check the query for reference.

𝐄𝐱𝐩𝐥𝐚𝐧𝐚𝐭𝐢𝐨𝐧 𝐭𝐨 𝐒𝐨𝐥𝐯𝐞 𝐐𝐮𝐞𝐫𝐲
1. TrainTimes CTE: We combine both the arrival and departure times into one unified dataset. For arrivals, we use 1 as the event_type to indicate the need for a platform. For departures, we use -1 as the event_type to indicate the freeing of a platform.

2. PlatformCount Subquery: We use a SUM with a window function (OVER clause) to maintain a running count of the platforms needed. The event_type for arrival adds one platform and the event_type for departure subtracts one.

3. Max(platforms_needed): Finally, we get the maximum value from the platforms_needed, which represents the maximum number of platforms required at any point in time.
