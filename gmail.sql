DROP TABLE IF EXISTS google_gmail_emails;

CREATE TABLE google_gmail_emails (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  from_user VARCHAR(50),
  to_user VARCHAR(50),
  day INT
);

INSERT INTO google_gmail_emails
  (from_user, to_user, day)
VALUES
  ('6edf0be4b2267df1fa', '75d295377a46f83236', 10),
  ('6edf0be4b2267df1fa', '32ded68d89443e808', 6),
  ('6edf0be4b2267df1fa', '55e60cfcc9dc49c17e', 10),
  ('6edf0be4b2267df1fa', 'e0e0defbb9ec47f6f7', 6),
  ('6edf0be4b2267df1fa', '47be2887786891367e', 1),
  ('6edf0be4b2267df1fa', '2813e59cf6c1ff698e', 6),
  ('6edf0be4b2267df1fa', 'a84065b7933ad01019', 8),
  ('6edf0be4b2267df1fa', '850badf89ed8f06854', 1),
  ('6edf0be4b2267df1fa', '6b503743a13d778200', 1),
  ('6edf0be4b2267df1fa', 'd63386c884aeb9f71d', 3),
  ('6edf0be4b2267df1fa', '5b8754928306a18b68', 2),
  ('6edf0be4b2267df1fa', '6edf0be4b2267df1fa', 8),
  ('6edf0be4b2267df1fa', '406539987dd9b679c0', 9),
  ('6edf0be4b2267df1fa', '114bafadff2d882864', 5),
  ('6edf0be4b2267df1fa', '157e3e9278e32aba3e', 2),
  ('75d295377a46f83236', '75d295377a46f83236', 6),
  ('75d295377a46f83236', 'd63386c884aeb9f71d', 8),
  ('75d295377a46f83236', '55e60cfcc9dc49c17e', 3),
  ('75d295377a46f83236', '47be2887786891367e', 10),
  ('75d295377a46f83236', '5b8754928306a18b68', 10),
  ('75d295377a46f83236', '850badf89ed8f06854', 7);

WITH
  distinct_users AS (
    SELECT
      day,
      COUNT(DISTINCT from_user) AS distinct_from,
      COUNT(DISTINCT to_user) AS distinct_to
    FROM google_gmail_emails
    GROUP BY day
  )
SELECT
  google_gmail_emails.day,
  google_gmail_emails.from_user,
  google_gmail_emails.to_user
FROM
  google_gmail_emails
  INNER JOIN distinct_users ON google_gmail_emails.day = distinct_users.day
WHERE distinct_users.distinct_from < distinct_users.distinct_to
ORDER BY distinct_users.day;
