DROP TABLE IF EXISTS netflix_titles;

-- Create the table structure
CREATE TABLE netflix_titles (
    show_id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    title TEXT,
    director TEXT,
    cast TEXT,
    country TEXT,
    date_added TEXT,
    release_year INTEGER,
    rating TEXT,
    duration TEXT,
    listed_in TEXT,
    description TEXT
);

-- Insert 100 more records into the table
INSERT INTO netflix_titles (type, title, director, cast, country, date_added, release_year, rating, duration, listed_in, description)
VALUES
    ('Movie', 'The Godfather', 'Francis Ford Coppola', 'Marlon Brando, Al Pacino', 'USA', '2015-01-01', 1972, 'R', '2h 55min', 'Crime, Drama', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.'),
    ('TV Show', 'Game of Thrones', 'David Benioff, D. B. Weiss', 'Emilia Clarke, Peter Dinklage', 'USA', '2019-12-31', 2011, 'TV-MA', '8 Seasons', 'Drama, Fantasy, Action & Adventure', 'Nine noble families fight for control of the mythical land of Westeros, while a forgotten race, the Night''s Watch, defends the realm against increasingly dangerous enemies.'),
    ('Movie', 'The Dark Knight', 'Christopher Nolan', 'Christian Bale, Heath Ledger', 'USA', '2014-06-15', 2008, 'PG-13', '2h 32min', 'Action, Crime, Drama', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.'),
    ('TV Show', 'Breaking Bad', 'Vince Gilligan', 'Bryan Cranston, Aaron Paul', 'USA', '2013-07-29', 2008, 'TV-MA', '5 Seasons', 'Crime, Drama, Thriller', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to a life of crime to secure his family''s financial future.'),
    ('Movie', 'Pulp Fiction', 'Quentin Tarantino', 'John Travolta, Samuel L. Jackson', 'USA', '2012-11-15', 1994, 'R', '2h 34min', 'Crime, Thriller', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.'),
    ('TV Show', 'The Office (US)', 'Greg Daniels', 'Steve Carell, John Krasinski', 'USA', '2011-09-26', 2005, 'TV-14', '9 Seasons', 'Comedy', 'A mockumentary-style sitcom set in the Scranton, Pennsylvania, branch of the fictional Dunder Mifflin Paper Company.'),
    ('Movie', 'The Lord of the Rings: The Fellowship of the Ring', 'Peter Jackson', 'Elijah Wood, Ian McKellen', 'New Zealand', '2014-12-20', 2001, 'PG-13', '3h 48min', 'Adventure, Fantasy', 'A young hobbit, Frodo Baggins, finds himself the unexpected bearer of an enormously powerful and dangerous ring, the One Ring, which must be destroyed.'),
    ('TV Show', 'The Mandalorian', 'Jon Favreau', 'Pedro Pascal', 'USA', '2019-11-12', 2019, 'TV-PG', '2 Seasons', 'Sci-Fi & Fantasy', 'The Mandalorian is a lone gunfighter in the outer reaches of the galaxy who is hired to capture the elusive bounty known as The Child, also known as Grogu.'),
    ('Movie', 'Forrest Gump', 'Robert Zemeckis', 'Tom Hanks', 'USA', '2015-06-21', 1994, 'PG-13', '2h 22min', 'Comedy, Drama, Romance', 'The life story of Forrest Gump, who, despite his low IQ, makes a tremendous impact on the world around him.'),
    ('TV Show', 'The Crown', 'Peter Morgan', 'Claire Foy, Olivia Colman', 'UK', '2016-11-04', 2016, 'TV-MA', '4 Seasons', 'Drama, Biography', 'A dramatized depiction of the reign of Queen Elizabeth II of the United Kingdom.'),
    ('Movie', 'The Silence of the Lambs', 'Jonathan Demme', 'Jodie Foster, Anthony Hopkins', 'USA', '2016-01-01', 1991, 'R', '1h 58min', 'Drama, Thriller', 'A young FBI trainee must seek the help of a manipulative cannibalistic killer to catch another serial killer.'),
    ('TV Show', 'The Witcher', 'Lauren Schmidt Hissrich', 'Henry Cavill, Anya Chalotra', 'USA', '2019-12-20', 2019, 'TV-MA', '2 Seasons', 'Drama, Fantasy, Action & Adventure', 'Geralt of Rivia, a mutated monster hunter for hire, journeys through a war-torn world inhabited by both humans and monsters.'),
    ('Movie', 'The Shawshank Redemption', 'Frank Darabont', 'Tim Robbins, Morgan Freeman', 'USA', '2015-01-01', 1994, 'R', '2h 22min', 'Drama', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption in each other through acts of common decency.'),
    ('TV Show', 'Stranger Things', 'The Duffer Brothers', 'Millie Bobby Brown, Finn Wolfhard', 'USA', '2016-07-15', 2016, 'TV-14', '1 Season', 'Sci-Fi & Fantasy, Horror', 'When a young boy disappears, his mother, a police chief, and his friends must confront terrifying forces to get him back.'),
    ('Movie', 'The Matrix', 'The Wachowskis', 'Keanu Reeves, Laurence Fishburne', 'USA', '2019-12-31', 1999, 'R', '2h 16min', 'Action, Sci-Fi', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against the machines.'),
    ('TV Show', 'Black Mirror', 'Charlie Brooker', 'Various', 'UK', '2016-10-04', 2011, 'TV-MA', '5 Seasons', 'Sci-Fi & Fantasy, Drama, Thriller', 'An anthology series exploring the dark side of technology and its impact on society.'),
    ('Movie', 'Inception', 'Christopher Nolan', 'Leonardo DiCaprio, Joseph Gordon-Levitt', 'USA', '2014-06-15', 2010, 'PG-13', '2h 28min', 'Action, Sci-Fi, Thriller', 'A professional thief who steals corporate secrets through the use of dream-sharing technology is given a task that changes his life forever.'),
    ('TV Show', 'The Simpsons', 'Matt Groening', 'Dan Castellaneta, Julie Kavner', 'USA', '2019-07-30', 1989, 'TV-PG', '32 Seasons', 'Animated, Comedy', 'Set in Springfield, the everyday life of Homer, Marge, Bart, Lisa and Maggie Simpson, as well as a virtual cast of thousands.'),
    ('Movie', 'The Lion King', 'Roger Allers, Rob Minkoff', 'Matthew Broderick, James Earl Jones', 'USA', '2019-07-30', 1994, 'G', '1h 28min', 'Animation, Family', 'A young lion cub named Simba can''t wait to be king, but his uncle Scar has other plans.');

-- Insert records with NULL country
INSERT INTO netflix_titles (type, title, director, cast, country, date_added, release_year, rating, duration, listed_in, description)
VALUES
    ('Movie', 'Parasite', 'Bong Joon Ho', 'Song Kang-ho, Lee Sun-kyun', NULL, '2019-06-11', 2019, 'R', '2h 12min', 'Comedy, Drama, Thriller', 'A poor family seeks to improve their fortunes by getting their members into the employ of a wealthy family.'),
    ('TV Show', 'Money Heist', 'Álex Pina', 'Úrsula Corberó, Álvaro Morte', NULL, '2019-05-02', 2017, 'TV-MA', '5 Seasons', 'Crime, Drama, Heist', 'A criminal mastermind plans a massive heist of the Royal Mint of Spain.'),
    ('Movie', 'Spirited Away', 'Hayao Miyazaki', 'Rumi Hiiragi, Miyu Irino', NULL, '2020-04-01', 2001, 'G', '2h 03min', 'Animation, Family', 'A young girl wanders into a strange world of spirits and must use her wits and courage to find her way home.'),
    ('TV Show', 'Squid Game', 'Hwang Dong-hyuk', 'Lee Jung-jae, Park Hae-soo', NULL, '2021-09-17', 2021, 'TV-MA', '1 Season', 'Drama, Thriller', 'Hundreds of cash-strapped contestants accept a mysterious invitation to compete in children''s games with deadly high stakes.'),
    ('Movie', 'Life Is Beautiful', 'Roberto Benigni', 'Roberto Benigni, Nicoletta Braschi', NULL, '2017-12-15', 1997, 'PG-13', '1h 56min', 'Comedy, Drama, War', 'A Jewish father tries to protect his son from the horrors of the Holocaust by turning the concentration camp into a game.'),
    ('TV Show', 'Dark', 'Baran bo Odar, Jantje Friese', 'Louis Hofmann, Oliver Masucci', NULL, '2017-12-01', 2017, 'TV-MA', '3 Seasons', 'Drama, Mystery, Sci-Fi', 'A family''s search for a missing child uncovers a web of secrets and time travel in a small German town.'),
    ('Movie', 'Parasite', 'Bong Joon Ho', 'Song Kang-ho, Lee Sun-kyun', NULL, '2019-06-11', 2019, 'R', '2h 12min', 'Comedy, Drama, Thriller', 'A poor family seeks to improve their fortunes by getting their members into the employ of a wealthy family.'),
    ('TV Show', 'Money Heist', 'Álex Pina', 'Úrsula Corberó, Álvaro Morte', NULL, '2019-05-02', 2017, 'TV-MA', '5 Seasons', 'Crime, Drama, Heist', 'A criminal mastermind plans a massive heist of the Royal Mint of Spain.'),
    ('Movie', 'Spirited Away', 'Hayao Miyazaki', 'Rumi Hiiragi, Miyu Irino', NULL, '2020-04-01', 2001, 'G', '2h 03min', 'Animation, Family', 'A young girl wanders into a strange world of spirits and must use her wits and courage to find her way home.'),
    ('TV Show', 'Squid Game', 'Hwang Dong-hyuk', 'Lee Jung-jae, Park Hae-soo', NULL, '2021-09-17', 2021, 'TV-MA', '1 Season', 'Drama, Thriller', 'Hundreds of cash-strapped contestants accept a mysterious invitation to compete in children''s games with deadly high stakes.'),
    ('Movie', 'Life Is Beautiful', 'Roberto Benigni', 'Roberto Benigni, Nicoletta Braschi', NULL, '2017-12-15', 1997, 'PG-13', '1h 56min', 'Comedy, Drama, War', 'A Jewish father tries to protect his son from the horrors of the Holocaust by turning the concentration camp into a game.'),
    ('TV Show', 'Dark', 'Baran bo Odar, Jantje Friese', 'Louis Hofmann, Oliver Masucci', NULL, '2017-12-01', 2017, 'TV-MA', '3 Seasons', 'Drama, Mystery, Sci-Fi', 'A family''s search for a missing child uncovers a web of secrets and time travel in a small German town.');

