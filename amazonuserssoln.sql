SELECT DISTINCT
  (a.user_id) AS active_user
FROM
  amazon_transactions a
  JOIN amazon_transactions b USING (user_id)
WHERE
  a.created_at < b.created_at
  AND julianday(b.created_at) - julianday(a.created_at) <= 7;
