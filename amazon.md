Source: <https://www.linkedin.com/posts/im-nsk_sql-activity-7275706593873174528-xvuD>

## Amazon Purchases Rolling Average

Find the 3-month rolling average of total revenue from purchases given a table with users, their purchase amount, and date purchased. Do not include returns which are represented by negative purchase values. Output the year-month (YYYY-MM) and 3-month rolling average of revenue, sorted from earliest month to latest month.

A 3-month rolling average is defined by calculating the average total revenue from all user purchases for the current month and previous two months. The first two months will not be a true 3-month rolling average since we are not given data from last year. Assume each month has at least one purchase.

By solving this, you'll learn how to use Mutiple CTEs, Joins, Group by, Windows & Agg function. Give it a try and share the output!

## 𝐄𝐱𝐩𝐥𝐚𝐧𝐚𝐭𝐢𝐨𝐧 𝐭𝐨 𝐒𝐨𝐥𝐯𝐞 𝐐𝐮𝐞𝐫𝐲

3-month rolling average is the average of data from the last three months, calculated each month.

1. MonthlyRevenue CTE: Extracts the year and month (in YYYY-MM format) from created_at. Calculates the total revenue for each month, excluding negative values (representing returns).

2. RollingAverage CTE: For each month (mr1), joins it with the previous two months (mr2) using a date difference of up to 2 months. Computes the average total revenue across the current and previous two months.


