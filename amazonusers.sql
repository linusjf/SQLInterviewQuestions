DROP TABLE IF EXISTS amazon_transactions;

CREATE TABLE amazon_transactions (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  user_id int,
  item varchar(15),
  created_at datetime,
  revenue int
);

INSERT INTO
  amazon_transactions (user_id, item, created_at, revenue)
VALUES
  (109, 'milk', '2020-03-03 00:00:00', 123),
  (139, 'biscuit', '2020-03-18 00:00:00', 421),
  (120, 'milk', '2020-03-18 00:00:00', 176),
  (108, 'banana', '2020-03-18 00:00:00', 862),
  (130, 'milk', '2020-03-28 00:00:00', 333),
  (103, 'bread', '2020-03-29 00:00:00', 862),
  (122, 'banana', '2020-03-07 00:00:00', 952),
  (125, 'bread', '2020-03-13 00:00:00', 317),
  (139, 'bread', '2020-03-30 00:00:00', 929),
  (141, 'banana', '2020-03-17 00:00:00', 812),
  (116, 'bread', '2020-03-31 00:00:00', 226),
  (128, 'bread', '2020-03-04 00:00:00', 112),
  (146, 'biscuit', '2020-03-04 00:00:00', 362),
  (119, 'banana', '2020-03-28 00:00:00', 127),
  (142, 'bread', '2020-03-09 00:00:00', 503),
  (122, 'bread', '2020-03-06 00:00:00', 593),
  (128, 'biscuit', '2020-03-24 00:00:00', 160),
  (112, 'banana', '2020-03-24 00:00:00', 262),
  (149, 'banana', '2020-03-29 00:00:00', 382),
  (100, 'banana', '2020-03-18 00:00:00', 599);

SELECT
  *
FROM
  amazon_transactions;
