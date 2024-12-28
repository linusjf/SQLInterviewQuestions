select distinct(a.user_id) as active_user
  from amazon_transactions a
  join amazon_transactions b using(user_id)
  where a.created_at < b.created_at and
    julianday(b.created_at) - julianday(a.created_at) <= 7;
