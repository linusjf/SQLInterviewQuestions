with mutual_friends as (
select friend_id from friends where user_id= (select USER_ID from users where user_name= 'Karl')
intersect
select friend_id from friends where user_id= (select USER_ID from users where user_name= 'Hans')
)
select user_id,user_name from users where user_id in (select friend_id from mutual_friends);
