DROP TABLE IF EXISTS amazon_purchases;

CREATE TABLE amazon_purchases (
  created_at DATETIME,
  purchase_amt BIGINT,
  user_id BIGINT
);

INSERT INTO
amazon_purchases (created_at, purchase_amt, user_id)
VALUES
('2023-01-05', 1500, 101),
('2023-01-15', -200, 102),
('2023-02-10', 2000, 103),
('2023-02-20', 1200, 101),
('2023-03-01', 1800, 104),
('2023-03-15', -100, 102),
('2023-04-05', 2200, 105),
('2023-04-10', 1400, 103),
('2023-05-01', 2500, 106),
('2023-05-15', 1700, 107),
('2023-06-05', 1300, 108),
('2023-06-15', 1900, 109);
