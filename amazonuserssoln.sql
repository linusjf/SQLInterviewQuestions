SELECT DISTINCT trans_a.user_id AS active_user
FROM
  amazon_transactions AS trans_a
  INNER JOIN amazon_transactions AS trans_b ON trans_a.user_id = trans_b.user_id
WHERE
  trans_a.created_at < trans_b.created_at
  AND julianday(trans_b.created_at) - julianday(trans_a.created_at) <= 7;
