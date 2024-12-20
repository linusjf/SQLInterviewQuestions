Source: <https://www.linkedin.com/posts/im-nsk_sql-facebook-meta-activity-7252936016750104578-AzOz>

## 𝐌𝐮𝐬𝐭 𝐓𝐫𝐲: Meta/Facebook (Hard Level)

A table named “famous” has two columns called user id and follower id. It represents each user ID has a particular follower ID. These follower IDs are also users of #Facebook / #Meta. Then, find the famous percentage of each user. 
Famous Percentage = number of followers a user has / total number of users on the platform.

At first glance, this might seem tedious, but it's straightforward once you break it down. Give it a try!

## 𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭

CREATE TABLE famous (user_id INT, follower_id INT);

INSERT INTO famous VALUES
(1, 2), (1, 3), (2, 4), (5, 1), (5, 3), 
(11, 7), (12, 8), (13, 5), (13, 10), 
(14, 12), (14, 3), (15, 14), (15, 13);
-------------

I have provided an explanation and query, but I encourage you to try solving it first. Later, you can check the query for reference.

## 𝐄𝐱𝐩𝐥𝐚𝐧𝐚𝐭𝐢𝐨𝐧 𝐨𝐟 𝐭𝐡𝐞 𝐐𝐮𝐞𝐫𝐲

1. distinct_users CTE:
Combines user_id and follower_id using UNION to get all unique users on the platform. This helps us determine the total number of users.

2. follower_count CTE:
Counts the number of followers for each user_id by grouping the rows in the famous table. This gives a list of users with their follower counts.

2. Final SELECT Statement:
Uses the data from follower_count and distinct_users to calculate the famous percentage for each user.
