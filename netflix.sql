DROP TABLE IF EXISTS netflix_titles;

-- Create the table structure
CREATE TABLE netflix_titles (
    show_id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    title TEXT,
    director TEXT,
    cast TEXT,
    country TEXT,
    date_added DATE,
    release_year INTEGER,
    rating TEXT,
    duration TEXT,
    listed_in TEXT,
    description TEXT
);

-- Insert records into the table
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

INSERT INTO netflix_titles (type, title, director, cast, country, date_added, release_year, rating, duration, listed_in, description)
VALUES
    ('Movie', 'The Irishman', 'Martin Scorsese', 'Robert De Niro, Al Pacino', 'USA', '2019-11-27', 2019, 'R', '3h 29min', 'Crime, Drama', 'A mob hitman recalls his involvement with the powerful Bufalino crime family.'),
    ('Movie', 'Taxi Driver', 'Martin Scorsese', 'Robert De Niro, Jodie Foster', 'USA', '2020-01-15', 1976, 'R', '1h 49min', 'Crime, Drama', 'A mentally unstable Vietnam veteran works as a taxi driver in New York City, where the violence and alienation around him cause him to descend into madness.'),
    ('Movie', 'Goodfellas', 'Martin Scorsese', 'Robert De Niro, Ray Liotta', 'USA', '2018-09-14', 1990, 'R', '2h 26min', 'Biography, Crime, Drama', 'The true story of Henry Hill and his life in the mob, covering his relationship with his childhood friends, his mob associates, and his life of crime.'),
    ('Movie', 'Raging Bull', 'Martin Scorsese', 'Robert De Niro, Joe Pesci', 'USA', '2019-05-15', 1980, 'R', '2h 9min', 'Biography, Drama, Sport', 'The story of Jake LaMotta, a volatile middleweight boxer whose violence and jealousy destroy his career and his life.'),
    ('Movie', 'Casino', 'Martin Scorsese', 'Robert De Niro, Sharon Stone', 'USA', '2018-06-15', 1995, 'R', '2h 58min', 'Biography, Crime, Drama', 'The story of the rise and fall of a casino executive in Las Vegas.'),
    ('Movie', 'The Departed', 'Martin Scorsese', 'Leonardo DiCaprio, Matt Damon', 'USA', '2017-12-15', 2006, 'R', '2h 31min', 'Crime, Drama, Thriller', 'An undercover cop infiltrates a South Boston Irish mob, while a mole in the police department works for the mob boss.'),
    ('Movie', 'Shutter Island', 'Martin Scorsese', 'Leonardo DiCaprio, Mark Ruffalo', 'USA', '2010-12-20', 2010, 'R', '2h 18min', 'Mystery, Thriller', 'In 1954, a U.S. marshal investigates the disappearance of a murderess who escaped from a hospital for the criminally insane on a remote and desolate island.'),
    ('Movie', 'Gangs of New York', 'Martin Scorsese', 'Leonardo DiCaprio, Daniel Day-Lewis', 'USA', '2016-08-15', 2002, 'R', '2h 46min', 'Action, Drama, History', 'In 1863, Amsterdam Vallon returns to the Five Points area of New York City to seek revenge for the death of his father, who was killed by Bill the Butcher.'),
    ('Movie', 'The Aviator', 'Martin Scorsese', 'Leonardo DiCaprio, Cate Blanchett', 'USA', '2015-07-15', 2004, 'PG-13', '3h 08min', 'Biography, Drama, History', 'The life of famed aviator, filmmaker, and tycoon Howard Hughes, from the 1920s to the 1940s.'),
    ('Movie', 'Hugo', 'Martin Scorsese', 'Asa Butterfield, Chloë Grace Moretz', 'USA', '2011-11-15', 2011, 'PG', '1h 56min', 'Adventure, Family, Fantasy', 'An orphan boy living in the walls of a Paris train station must decipher a mysterious message left by his deceased father.'),
    ('Movie', 'The Wolf of Wall Street', 'Martin Scorsese', 'Leonardo DiCaprio, Jonah Hill', 'USA', '2013-12-15', 2013, 'R', '3h', 'Biography, Comedy, Crime', 'Based on the true story of Jordan Belfort, a stockbroker who defrauded millions of dollars through a penny stock boiler room.'),
    ('Movie', 'Silence', 'Martin Scorsese', 'Andrew Garfield, Adam Driver', 'USA', '2016-04-29', 2016, 'R', '2h 41min', 'Drama, History', 'In the 17th century, two Jesuit priests travel to Japan to find their mentor who has gone missing.'),
    ('Movie', 'Kundun', 'Martin Scorsese', 'Tenzin Thuthob Tsangpo, Tenzin Gyatso', 'USA', '2015-09-15', 1997, 'PG', '2h 23min', 'Biography, Drama, History', 'The story of the 14th Dalai Lama, from his childhood to his exile in India.'),
    ('Movie', 'The Age of Innocence', 'Martin Scorsese', 'Daniel Day-Lewis, Michelle Pfeiffer', 'USA', '2014-01-15', 1993, 'PG', '2h 18min', 'Drama, Romance', 'In 1870s New York City, a young lawyer is torn between his duty to his social class and his love for a scandalous woman.'),
    ('Movie', 'After Hours', 'Martin Scorsese', 'Griffin Dunne, Rosanna Arquette', 'USA', '2012-03-15', 1985, 'R', '1h 37min', 'Comedy, Thriller', 'A word processor experiences a series of increasingly bizarre and dangerous events after a chance encounter with a mysterious woman.'),
    ('Movie', 'New York, New York', 'Martin Scorsese', 'Robert De Niro, Liza Minnelli', 'USA', '2011-05-15', 1977, 'PG', '1h 43min', 'Drama, Music, Romance', 'A saxophonist and a singer fall in love and build a career together, but their relationship is tested by their ambitions and egos.'),
    ('Movie', 'Mean Streets', 'Martin Scorsese', 'Harvey Keitel, Robert De Niro', 'USA', '2010-07-15', 1973, 'R', '1h 35min', 'Crime, Drama', 'The lives of two small-time mobsters in New York City''s Little Italy.'),
    ('Movie', 'Alice Doesn''t Live Here Anymore', 'Martin Scorsese', 'Ellen Burstyn, Alfred Lutter', 'USA', '2009-09-15', 1974, 'PG', '1h 57min', 'Comedy, Drama', 'A widowed waitress and her young son embark on a cross-country road trip in search of a better life.'),
    ('Movie', 'Boxcar Bertha', 'Martin Scorsese', 'Barbara Hershey, David Carradine', 'USA', '2008-11-15', 1972, 'R', '1h 37min', 'Crime, Drama', 'The true story of Bertha Thompson, a Depression-era woman who becomes a notorious train robber.');

-- Insert records for movies directed by Steven Spielberg with duration
INSERT INTO netflix_titles (type, title, director, cast, country, date_added, release_year, rating, duration, listed_in, description)
VALUES
    ('Movie', 'Jaws', 'Steven Spielberg', 'Roy Scheider, Robert Shaw', 'USA', '2015-01-01', 1975, 'PG', '1h 58min', 'Adventure, Thriller', 'The mayor of a small seaside town must confront a dangerous great white shark that is attacking beachgoers.'),
    ('Movie', 'Close Encounters of the Third Kind', 'Steven Spielberg', 'Richard Dreyfuss, Teri Garr', 'USA', '2016-02-15', 1977, 'PG', '1h 58min', 'Sci-Fi', 'A government employee and his family encounter a UFO and become obsessed with the extraterrestrial life forms.'),
    ('Movie', 'Raiders of the Lost Ark', 'Steven Spielberg', 'Harrison Ford, Karen Allen', 'USA', '2017-03-20', 1981, 'PG-13', '1h 55min', 'Action, Adventure', 'An archaeologist must race against time to find the Ark of the Covenant before it falls into the hands of the Nazis.'),
    ('Movie', 'E.T. the Extra-Terrestrial', 'Steven Spielberg', 'Henry Thomas, Dee Wallace', 'USA', '2018-04-25', 1982, 'PG', '1h 55min', 'Family, Sci-Fi', 'A young boy befriends an extraterrestrial who is stranded on Earth.'),
    ('Movie', 'Jurassic Park', 'Steven Spielberg', 'Sam Neill, Laura Dern', 'USA', '2019-06-01', 1993, 'PG-13', '2h 9min', 'Action, Adventure, Sci-Fi', 'A wealthy entrepreneur secretly creates a theme park of genetically engineered dinosaurs on a remote island.'),
    ('Movie', 'Schindler''s List', 'Steven Spielberg', 'Liam Neeson, Ben Kingsley', 'USA', '2020-07-05', 1993, 'R', '3h 15min', 'Biography, Drama, History', 'The true story of Oskar Schindler, a German industrialist who saved the lives of hundreds of Jews during the Holocaust.'),
    ('Movie', 'Saving Private Ryan', 'Steven Spielberg', 'Tom Hanks, Matt Damon', 'USA', '2021-08-10', 1998, 'R', '2h 49min', 'Drama, War', 'A group of U.S. soldiers are sent on a dangerous mission to find and rescue a paratrooper whose brothers have been killed in action.'),
    ('Movie', 'Munich', 'Steven Spielberg', 'Eric Bana, Daniel Craig', 'USA', '2012-01-04', 2005, 'R', '2h 29min', 'Drama, History, Thriller', 'The true story of the Israeli Mossad agents who were tasked with tracking down and assassinating the Black September members responsible for the massacre of Israeli athletes at the 1972 Munich Olympics.'),
    ('Movie', 'The BFG', 'Steven Spielberg', 'Mark Rylance, Ruby Barnhill', 'USA', '2016-07-01', 2016, 'PG', '1h 57min', 'Adventure, Family, Fantasy', 'A young girl named Sophie befriends a giant who is different from the other giants, who are all brutes.'),
    ('Movie', 'Indiana Jones and the Raiders of the Lost Ark', 'Steven Spielberg', 'Harrison Ford, Karen Allen', 'USA', '2017-03-20', 1981, 'PG-13', '1h 55min', 'Action, Adventure', 'An archaeologist must race against time to find the Ark of the Covenant before it falls into the hands of the Nazis.'),
    ('Movie', 'Indiana Jones and the Temple of Doom', 'Steven Spielberg', 'Harrison Ford, Kate Capshaw', 'USA', '2016-05-15', 1984, 'PG-13', '1h 59min', 'Action, Adventure', 'Indiana Jones travels to India to find a sacred stone that has been stolen.');

-- Insert TV show data without show_id
INSERT INTO netflix_titles (type, title, director, cast, country, date_added, release_year, rating, duration, listed_in, description)
VALUES
  ('TV Show', 'Stranger Things', 'Matt Duffer', 'Winona Ryder, David Harbour', 'USA', 'July 15, 2016', 2016, 'PG-13', '4 Seasons', 'Dramas, Horror', 'A sci-fi horror series that follows a group of kids as they battle supernatural forces in their small town.'),
  ('TV Show', 'The Crown', 'Peter Morgan', 'Claire Foy, Matt Smith', 'UK, USA', 'November 4, 2016', 2016, 'PG-13', '4 Seasons', 'Dramas, History', 'A historical drama series that follows the reign of Queen Elizabeth II.'),
  ('TV Show', 'Narcos', 'Chris Brancato', 'Wagner Moura, Boyd Holbrook', 'USA, Colombia', 'September 2, 2016', 2015, 'MA', '3 Seasons', 'Biographical, Dramas', 'A crime drama series that follows the rise and fall of Pablo Escobar.'),
  ('TV Show', 'Orange is the New Black', 'Jenji Kohan', 'Taylor Schilling, Laura Prepon', 'USA', 'July 11, 2013', 2013, 'MA', '7 Seasons', 'Comedies, Dramas', 'A comedy-drama series that follows the lives of women in prison.'),
  ('TV Show', 'Black Mirror', 'Charlie Brooker', 'Bryce Dallas Howard, Alice Eve', 'UK, USA', 'October 21, 2016', 2011, 'PG-13', '7 Seasons', 'Sci-Fi, Thrillers', 'A sci-fi anthology series that explores the dark side of technology.');
