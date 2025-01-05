DROP TABLE IF EXISTS user_content;

CREATE TABLE user_content (
  content_id INTEGER PRIMARY KEY AUTOINCREMENT,
  customer_id INT,
  content_type VARCHAR(50),
  content_text VARCHAR(255)
);

INSERT INTO
  user_content (customer_id, content_type, content_text)
VALUES
  (2, 'comment', 'hello world! this is a TEST.'),
  (8, 'comment', 'what a great day'),
  (4, 'comment', 'WELCOME to the event.'),
  (2, 'comment', 'e-commerce is booming.'),
  (6, 'comment', 'Python is fun!!'),
  (6, 'review', '123 numbers in text.'),
  (10, 'review', 'special chars: @#$$%^&*()'),
  (4, 'comment', 'multiple CAPITALS here.'),
  (6, 'review', 'sentence. and ANOTHER sentence!'),
  (2, 'post', 'goodBYE!');

WITH
  json_convert AS (
    SELECT
      *,
      '[' || replace(quote(content_text), ' ', ''',''') || ']' AS json_text
    FROM
      user_content
  ),
  capitalized AS (
    SELECT
      content_text,
      UPPER(substring(x.value, 1, 1)) || substring(x.value, 2) AS json_vals
    FROM
      json_convert,
      json_each(json_text) AS x
  )
SELECT
  content_text,
  group_concat(json_vals, ' ') AS capitalized_text
FROM
  capitalized
GROUP BY
  content_text;
