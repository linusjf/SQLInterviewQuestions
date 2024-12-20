WITH distinct_users as (
  SELECT user_id as users from famous
  UNION
  SELECT follower_id from famous
),
follower_count as (
  select user_id as user,
  count(follower_id) as follower_count
  from famous
  group by user
)
SELECT user,
       ROUND(follower_count * 100.0 / (select COUNT(*) from distinct_users), 2) as fame_metric
       from follower_count
       order by fame_metric desc;
