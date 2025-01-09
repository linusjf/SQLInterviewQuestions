DROP TABLE IF EXISTS oscar_nominees;

DROP TABLE IF EXISTS nominee_information;

CREATE TABLE nominee_information (
  name VARCHAR(20),
  amg_person_id VARCHAR(10),
  top_genre VARCHAR(10),
  birthday DATETIME,
  id INT
);

INSERT INTO
  nominee_information
VALUES
  (
    'Jennifer Lawrence',
    'P562566',
    'Drama',
    '1990-08-15',
    755
  ),
  (
    'Jonah Hill',
    'P418718',
    'Comedy',
    '1983-12-20',
    747
  ),
  (
    'Anne Hathaway',
    'P292630',
    'Drama',
    '1982-11-12',
    744
  ),
  (
    'Jennifer Hudson',
    'P454405',
    'Drama',
    '1981-09-12',
    742
  ),
  (
    'Rinko Kikuchi',
    'P475244',
    'Drama',
    '1981-01-06',
    739
  );

CREATE TABLE oscar_nominees (
  year INT,
  category VARCHAR(30),
  nominee VARCHAR(20),
  movie VARCHAR(30),
  winner INT,
  id INT
);

INSERT INTO
  oscar_nominees
VALUES
  (
    2008,
    'actress in a leading role',
    'Anne Hathaway',
    'Rachel Getting Married',
    0,
    77
  ),
  (
    2012,
    'actress in a supporting role',
    'Anne Hathaway',
    'Les Miserables',
    1,
    78
  ),
  (
    2006,
    'actress in a supporting role',
    'Jennifer Hudson',
    'Dreamgirls',
    1,
    711
  ),
  (
    2010,
    'actress in a leading role',
    'Jennifer Lawrence',
    'Winters Bone',
    1,
    717
  ),
  (
    2012,
    'actress in a leading role',
    'Jennifer Lawrence',
    'Silver Linings Playbook',
    1,
    718
  ),
  (
    2011,
    'actor in a supporting role',
    'Jonah Hill',
    'Moneyball',
    0,
    799
  ),
  (
    2006,
    'actress in a supporting role',
    'Rinko Kikuchi',
    'Babel',
    0,
    1253
  );
