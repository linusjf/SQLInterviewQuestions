DROP TABLE IF EXISTS famous;

CREATE TABLE famous (user_id INT, follower_id INT);

INSERT INTO famous VALUES
(1, 2), (1, 3), (2, 4), (5, 1), (5, 3),
(11, 7), (12, 8), (13, 5), (13, 10),
(14, 12), (14, 3), (15, 14), (15, 13);
