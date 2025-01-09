DROP TABLE IF EXISTS facebook_posts;

DROP TABLE IF EXISTS facebook_reactions;

CREATE TABLE facebook_reactions (
  poster INTEGER PRIMARY KEY AUTOINCREMENT,
  friend INT,
  reaction VARCHAR(50),
  date_day INT,
  post_id INT
);

INSERT INTO
  facebook_reactions (friend, reaction, date_day, post_id)
VALUES
  (2, 'heart', 20240101, 101),
  (3, 'heart', 20240102, 102),
  (4, 'like', 20240103, 103),
  (5, 'heart', 20240104, 104),
  (6, 'laugh', 20240105, 105),
  (7, 'heart', 20240106, 106);

CREATE TABLE facebook_posts (
  post_id INT PRIMARY KEY,
  poster INT,
  post_text VARCHAR(500),
  post_keywords VARCHAR(200),
  post_date DATETIME
);

INSERT INTO
  facebook_posts (
    post_id,
    poster,
    post_text,
    post_keywords,
    post_date
  )
VALUES
  (
    101,
    1,
    'Had a great day at the park!',
    'park, fun',
    '2024-01-01 08:00:00'
  ),
  (
    102,
    2,
    'Enjoying the new book I bought.',
    'book, reading',
    '2024-01-02 09:00:00'
  ),
  (
    103,
    3,
    'Looking forward to the weekend!',
    'weekend, plans',
    '2024-01-03 10:00:00'
  ),
  (
    104,
    4,
    'Just finished a workout session!',
    'workout, fitness',
    '2024-01-04 11:00:00'
  ),
  (
    105,
    5,
    'Great movie night with friends!',
    'movie, friends',
    '2024-01-05 12:00:00'
  ),
  (
    106,
    6,
    'Cooking dinner at home tonight.',
    'cooking, food',
    '2024-01-06 13:00:00'
  );

SELECT
  posts.*
FROM
  facebook_posts AS posts
  INNER JOIN facebook_reactions ON posts.post_id = facebook_reactions.post_id
  AND posts.poster = facebook_reactions.poster
WHERE
  reaction = 'heart';