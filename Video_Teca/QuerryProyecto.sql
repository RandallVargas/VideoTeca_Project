Use Video_Teca_C13448_B98314

Create Table MoviesAndSeries(
id varchar(50) Primary Key,
title varchar(50),
synopsis varchar(200),
release_year date,
duration time,
clasification char(10),
director varchar(50),
num_seasons int,
num_episodes int,
episode_duration time,
movie_cover varchar(100),
year_of_release date,
date_addded date,
media_type VARCHAR(10) CHECK (media_type IN ('movie', 'series')),

);
ALTER TABLE MoviesAndSeries
DROP COLUMN genre_id;

ALTER TABLE MoviesAndSeries
ALTER COLUMN clasification char(10);
CREATE TABLE MovieGenre (
  movie_and_serie_id VARCHAR(50),
  genre_id VARCHAR(50),
  FOREIGN KEY (movie_and_serie_id) REFERENCES MoviesAndSeries(id),
  FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);
Create Table Ratings(
rating_id int,
movie_series_id varchar(50),
user_id varchar(50),
rating int, 
 FOREIGN KEY (movie_series_id) REFERENCES MoviesAndSeries(id),
);

Create Table Genres
(
genre_id varchar(50) Primary Key,
genre_name varchar(30)
);

CREATE TABLE MovieGenre (
  movie_id VARCHAR(50),
  genre_id VARCHAR(50),
  FOREIGN KEY (movie_id) REFERENCES MoviesAndSeries(id),
  FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);
Insert into MovieGenre(movie_id,genre_id)
values('MVS002', 1)
Insert into MovieGenre(movie_id,genre_id)
values('MVS002', 5)
Create Table Episodes(
episode_id int,
title varchar(50),
duration time,
episode_number int,
movie_series_id varchar(50)
FOREIGN KEY (movie_series_id) REFERENCES MoviesAndSeries(id),
);

CREATE TABLE Actors (
    actor_id INT PRIMARY KEY,
    actor_first_name VARCHAR(50),
    actor_last_name VARCHAR(50),
    actor_img VARCHAR(500)
);
drop table MovieActor
drop table Actors
CREATE TABLE MovieActor (
    movie_id VARCHAR(50),
    actor_id INT,
    FOREIGN KEY (movie_id) REFERENCES MoviesAndSeries(id),
    FOREIGN KEY (actor_id) REFERENCES Actors(actor_id)
);

CREATE TABLE Comments (
  comment_id VARCHAR(50) PRIMARY KEY,
  movie_series_id VARCHAR(50),
  userid int,
  comment VARCHAR(250),
  FOREIGN KEY (movie_series_id) REFERENCES MoviesAndSeries(id),
  FOREIGN KEY (userid) REFERENCES Users(id)
);

CREATE PROCEDURE GetCommentsByMovieId

    @movieId VARCHAR(50)
AS
BEGIN
    SELECT *
    FROM Comments
    WHERE movie_series_id = @movieId
END

CREATE PROCEDURE GetGenresByMovieId
    @MovieId VARCHAR(50)
AS
BEGIN
  SELECT g.genre_name
    FROM Genres g
    WHERE EXISTS (
        SELECT 1
        FROM MovieGenre mg
        WHERE mg.genre_id = g.genre_id
        AND mg.movie_id = @MovieId
    )
END
EXEC GetGenresByMovieId @MovieId = 'MVS002'
Drop Procedure GetCommentsByMovieId
Drop Procedure GetGenresByMovieId
ALTER TABLE Comments
ADD Username VARCHAR(30);
EXEC GetCommentsByMovieId @movieId = 'MVS002'


insert into MovieActor(movie_id,actor_id)
values('MVS003',1)

INSERT INTO Genres (genre_id, genre_name) VALUES ('1', 'Action');
INSERT INTO Genres (genre_id, genre_name) VALUES ('2', 'Adventure');
INSERT INTO Genres (genre_id, genre_name) VALUES ('3', 'Comedy');
INSERT INTO Genres (genre_id, genre_name) VALUES ('4', 'Drama');
INSERT INTO Genres (genre_id, genre_name) VALUES ('5', 'Science Fiction');
INSERT INTO Genres (genre_id, genre_name) VALUES ('6', 'Thriller');
INSERT INTO Genres (genre_id, genre_name) VALUES ('7', 'Romance');
INSERT INTO Genres (genre_id, genre_name) VALUES ('8', 'Animation');
INSERT INTO Genres (genre_id, genre_name) VALUES ('9', 'Fantasy');
INSERT INTO Genres (genre_id, genre_name) VALUES ('10', 'Documentary');

'MVS001': Drama (DR001)
'MVS002': Crime (CR002)
'MVS003': Action (AC003)


'MVS006': Science Fiction (SC004)

'MVS008': Fantasy (FC001)



'MVS015': Thriller (TH002)



'MVS024': Animation (AC004)


Delete from Actors
INSERT INTO Actors (actor_id, actor_first_name, actor_last_name, actor_img) 
VALUES (1, 'Chris', 'Evans', 'https://media.revistavanityfair.es/photos/60e8605006a9cde9aea6d749/master/w_1600%2Cc_limit/45447.jpg');

INSERT INTO Actors (actor_id, actor_first_name, actor_last_name, actor_img) 
VALUES (2, 'Hayley', 'Atwell', 'hayley_atwell.jpg');

INSERT INTO Actors (actor_id, actor_first_name, actor_last_name, actor_img) 
VALUES (3, 'Sebastian', 'Stan', 'sebastian_stan.jpg');

INSERT INTO Actors (actor_id, actor_first_name, actor_last_name, actor_img) 
VALUES (4, 'Tommy', 'Lee Jones', 'tommy_lee_jones.jpg');

INSERT INTO Actors (actor_id, actor_first_name, actor_last_name, actor_img) 
VALUES (5, 'Hugo', 'Weaving', 'hugo_weaving.jpg');

INSERT INTO Actors (actor_id, actor_first_name, actor_last_name, actor_img) 
VALUES (6, 'Dominic', 'Cooper', 'dominic_cooper.jpg');

INSERT INTO MoviesAndSeries(id, title, synopsis, release_year, duration, clasification, director, genre_id, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)
VALUES ('MVS002', 'Captain America: The First Avenger', 'During World War II, Steve Rogers volunteers for an experimental program that turns him into the super soldier known as Captain America.',
'2011-07-22', '02:04:00', 'Td', 'Joe Johnston', 'Accion', 
NULL, NULL, NULL, 'https://es.web.img2.acsta.net/medias/nmedia/18/84/69/36/19774917.jpg', '2011', '2020-02-15', 'movie');

INSERT INTO MoviesAndSeries (id, title, synopsis, release_year, duration, clasification, director, genre_id, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)
VALUES ('MVS003', 'Captain America: The Winter Soldier', 'After the cataclysmic events in New York with The Avengers, Steve Rogers, aka Captain America, lives quietly in Washington, D.C. ',
'2014-04-04', '02:16:00', 'TD', 'Anthony Russo, Joe Russo', 'Accion',
NULL, NULL, NULL, 'https://es.web.img3.acsta.net/pictures/14/01/31/16/12/220933.jpg', '2014', '2021-06-10', 'movie');

INSERT INTO MoviesAndSeries (id, title, synopsis, release_year, duration, clasification, director, genre_id, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)
VALUES
('MVS001', 'Inception', 'A skilled thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', '2010-07-16', '02:28:00', 'PG-13', 'Christopher Nolan', 'Action'),


INSERT INTO MoviesAndSeries (id, title, synopsis, release_year, duration, clasification, director, genre_id, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_added, media_type)
VALUES
('MVS001', 'The Shawshank Redemption', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', '1994', '2h 22min', 'R', 'Frank Darabont', 'DR001', NULL, NULL, NULL, 'https://www.example.com/shawshank_redemption.jpg', '1994', '2021-05-10', 'movie'),
('MVS002', 'Pulp Fiction', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', '1994', '2h 34min', 'R', 'Quentin Tarantino', 'CR002', NULL, NULL, NULL, 'https://www.example.com/pulp_fiction.jpg', '1994', '2021-05-10', 'movie'),
('MVS003', 'The Dark Knight', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', '2008', '2h 32min', 'PG-13', 'Christopher Nolan', 'AC003', NULL, NULL, NULL, 'https://www.example.com/dark_knight.jpg', '2008', '2021-05-10', 'movie'),
('MVS004', 'The Godfather', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', '1972', '2h 55min', 'R', 'Francis Ford Coppola', 'CR001', NULL, NULL, NULL, 'https://www.example.com/the_godfather.jpg', '1972', '2021-05-10', 'movie'),
('MVS005', 'Fight Club', 'An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more.', '1999', '2h 19min', 'R', 'David Fincher', 'DR002', NULL, NULL, NULL, 'https://www.example.com/fight_club.jpg', '1999', '2021-05-10', 'movie'),
('MVS006', 'The Matrix', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', '1999', '2h 16min', 'R', 'Lana Wachowski, Lilly Wachowski', 'SC004', NULL, NULL, NULL, 'https://www.example.com/the_matrix.jpg', '1999', '2021-05-10', 'movie'),
('MVS007', 'Forrest Gump', 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal, and other historical events unfold through the perspective of an Alabama man with an IQ of 75.', '1994', '2h 22min', 'PG-13', 'Robert Zemeckis', 'DR001', NULL, NULL, NULL, 'https://www.example.com/forrest_gump.jpg', '1994', '2021-05-10', 'movie'),
('MVS008', 'The Lord of the Rings: The Fellowship of the Ring', 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', '2001', '2h 58min', 'PG-13', 'Peter Jackson', 'FC001', NULL, NULL, NULL, 'https://www.example.com/lotr_fellowship.jpg', '2001', '2021-05-10', 'movie'),
('MVS009', 'The Shawshank Redemption', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', '1994', '2h 22min', 'R', 'Frank Darabont', 'DR001', NULL, NULL, NULL, 'https://www.example.com/shawshank_redemption.jpg', '1994', '2021-05-10', 'movie'),
('MVS010', 'The Dark Knight Rises', 'Eight years after the Joker\s reign of anarchy, Batman, with the help of the enigmatic Catwoman, is forced from his exile to save Gotham City from the brutal guerrilla terrorist Bane.', '2012', '2h 44min', 'PG-13', 'Christopher Nolan', 'AC003', NULL, NULL, NULL, 'https://www.example.com/dark_knight_rises.jpg', '2012', '2021-05-10', 'movie'),
('MVS011', 'The Lord of the Rings: The Two Towers', 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron\s new ally, Saruman, and his hordes of Isengard.', '2002', '2h 59min', 'PG-13', 'Peter Jackson', 'FC001', NULL, NULL, NULL, 'https://www.example.com/lotr_two_towers.jpg', '2002', '2021-05-10', 'movie'),
('MVS012', 'Inception', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', '2010', '2h 28min', 'PG-13', 'Christopher Nolan', 'AC003', NULL, NULL, NULL, 'https://www.example.com/inception.jpg', '2010', '2021-05-10', 'movie'),
('MVS013', 'Goodfellas', 'The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners Jimmy Conway and Tommy DeVito in the Italian-American crime syndicate.', '1990', '2h 26min', 'R', 'Martin Scorsese', 'CR001', NULL, NULL, NULL, 'https://www.example.com/goodfellas.jpg', '1990', '2021-05-10', 'movie'),
('MVS014', 'The Lord of the Rings: The Return of the King', 'Gandalf and Aragorn lead the World of Men against Sauron\s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.', '2003', '3h 21min', 'PG-13', 'Peter Jackson', 'FC001', NULL, NULL, NULL, 'https://www.example.com/lotr_return_king.jpg', '2003', '2021-05-10', 'movie'),
('MVS015', 'The Silence of the Lambs', 'A young F.B.I. cadet must confide in an incarcerated and manipulative killer to receive his help on catching another serial killer who skins his victims.', '1991', '1h 58min', 'R', 'Jonathan Demme', 'TH002', NULL, NULL, NULL, 'https://www.example.com/silence_lambs.jpg', '1991', '2021-05-10', 'movie'),
('MVS016', 'Seven Samurai', 'A poor village under attack by bandits recruits seven unemployed samurai to help them defend themselves.', '1954', '3h 27min', 'Unrated', 'Akira Kurosawa', 'AC001', NULL, NULL, NULL, 'https://www.example.com/seven_samurai.jpg', '1954', '2021-05-10', 'movie'),
('MVS017', 'The Prestige', 'After a tragic accident, two stage magicians engage in a battle to create the ultimate illusion while sacrificing everything they have to outwit each other.', '2006', '2h 10min', 'PG-13', 'Christopher Nolan', 'DR003', NULL, NULL, NULL, 'https://www.example.com/the_prestige.jpg', '2006', '2021-05-10', 'movie'),
('MVS018', 'Gladiator', 'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.', '2000', '2h 35min', 'R', 'Ridley Scott', 'AC002', NULL, NULL, NULL, 'https://www.example.com/gladiator.jpg', '2000', '2021-05-10', 'movie'),
('MVS019', 'Interstellar', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity/s survival.', '2014', '2h 49min', 'PG-13', 'Christopher Nolan', 'SC004', NULL, NULL, NULL, 'https://www.example.com/interstellar.jpg', '2014', '2021-05-10', 'movie'),
('MVS020', 'The Departed', 'An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in South Boston.', '2006', '2h 31min', 'R', 'Martin Scorsese', 'CR001', NULL, NULL, NULL, 'https://www.example.com/the_departed.jpg', '2006', '2021-05-10', 'movie'),
('MVS021', 'The Green Mile', 'The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder and rape, yet who has a mysterious gift.', '1999', '3h 9min', 'R', 'Frank Darabont', 'DR001', NULL, NULL, NULL, 'https://www.example.com/green_mile.jpg', '1999', '2021-05-10', 'movie'),
('MVS022', 'The Pianist', 'A Polish Jewish musician struggles to survive the destruction of the Warsaw ghetto of World War II.', '2002', '2h 30min', 'R', 'Roman Polanski', 'DR004', NULL, NULL, NULL, 'https://www.example.com/the_pianist.jpg', '2002', '2021-05-10', 'movie'),
('MVS023', 'Whiplash', 'A promising young drummer enrolls at a cut-throat music conservatory where his dreams of greatness are mentored by an instructor who will stop at nothing to realize a student\s potential.', '2014', '1h 47min', 'R', 'Damien Chazelle', 'DR005', NULL, NULL, NULL, 'https://www.example.com/whiplash.jpg', '2014', '2021-05-10', 'movie'),
('MVS024', 'The Lion King', 'Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself.', '1994', '1h 28min', 'G', 'Roger Allers, Rob Minkoff', 'AC004', NULL, NULL, NULL, 'https://www.example.com/lion_king.jpg', '1994', '2021-05-10', 'movie'),
('MVS025', 'Schindler`s List', 'In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.', '1993', '3h 15min', 'R', 'Steven Spielberg', 'DR004', NULL, NULL, NULL, 'https://www.example.com/schindlers_list.jpg', '1993', '2021-05-10', 'movie'),
('MVS026', 'The Avengers', 'Earth`s mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.', '2012', '2h 23min', 'PG-13', 'Joss Whedon', 'AC003', NULL, NULL, NULL, 'https://www.example.com/the_avengers.jpg', '2012', '2021-05-10', 'movie'),
('MVS027', 'The Usual Suspects', 'A sole survivor tells of the twisty events leading up to a horrific gun battle on a boat, which began when five criminals met at a seemingly random police lineup.', '1995', '1h 46min', 'R', 'Bryan Singer', 'CR002', NULL, NULL, NULL, 'https://www.example.com/usual_suspects.jpg', '1995', '2021-05-10', 'movie'),
('MVS028', 'Saving Private Ryan', 'Following the Normandy Landings, a group of U.S. soldiers go behind enemy lines to retrieve a paratrooper whose brothers have been killed in action.', '1998', '2h 49min', 'R', 'Steven Spielberg', 'AC004', NULL, NULL, NULL, 'https://www.example.com/saving_private_ryan.jpg', '1998', '2021-05-10', 'movie'),
('MVS029', 'The Dark Knight', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', '2008', '2h 32min', 'PG-13', 'Christopher Nolan', 'AC003', NULL, NULL, NULL, 'https://www.example.com/dark_knight.jpg', '2008', '2021-05-10', 'movie'),
('MVS030', 'The Wolf of Wall Street', 'Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption, and the federal government.', '2013', '3h', 'R', 'Martin Scorsese', 'DR006', NULL, NULL, NULL, 'https://www.example.com/wolf_wall_street.jpg', '2013', '2021-05-10', 'movie'),
('MVS031', 'Spirited Away', 'During her family`s move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits, and where humans are changed into beasts.', '2001', '2h 5min', 'PG', 'Hayao Miyazaki', 'AC005', NULL, NULL, NULL, 'https://www.example.com/spirited_away.jpg', '2001', '2021-05-10', 'movie'),
('MVS032', 'The Departed', 'An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in South Boston.', '2006', '2h 31min', 'R', 'Martin Scorsese', 'CR001', NULL, NULL, NULL, 'https://www.example.com/the_departed.jpg', '2006', '2021-05-10', 'movie'),
('MVS033', 'Life Is Beautiful', 'When an open-minded Jewish librarian and his son become victims of the Holocaust, he uses a perfect mixture of will, humor, and imagination to protect his son from the dangers around their camp.', '1997', '1h 56min', 'PG-', 'Roberto Benigni', 'DR007', NULL, NULL, NULL, 'https://www.example.com/life_is_beautiful.jpg', '1997', '2021-05-10', 'movie'),
('MVS034', 'The Intouchables', 'After he becomes a quadriplegic from a paragliding accident, an aristocrat hires a young man from the projects to be his caretaker.', '2011', '1h 52min', 'R', 'Olivier Nakache, Éric Toledano', 'DR008', NULL, NULL, NULL, 'https://www.example.com/intouchables.jpg', '2011', '2021-05-10', 'movie'),
('MVS035', 'The Dark Knight Rises', 'Eight years after the Joker`s reign of anarchy, Batman, with the help of the enigmatic Catwoman, is forced from his exile to save Gotham City from the brutal guerrilla terrorist Bane.', '2012', '2h 44min', 'PG-13', 'Christopher Nolan', 'AC003', NULL, NULL, NULL, 'https://www.example.com/dark_knight_rises.jpg', '2012', '2021-05-10', 'movie'),
('MVS036', 'Coco', 'Aspiring musician Miguel, confronted with his family`s ancestral ban on music, enters the Land of the Dead to find his great-great-grandfather, a legendary singer.', '2017', '1h 45min', 'PG', 'Lee Unkrich, Adrian Molina', 'AC006', NULL, NULL, NULL, 'https://www.example.com/coco.jpg', '2017', '2021-05-10', 'movie'),
('MVS037', 'Oldboy', 'After being kidnapped and imprisoned for 15 years, Oh Dae-Su is released, only to find that he must find his captor in 5 days.', '2003', '2h', 'R', 'Chan-wook Park', 'TH003', NULL, NULL, NULL, 'https://www.example.com/oldboy.jpg', '2003', '2021-05-10', 'movie'),
('MVS038', 'Your Name.', 'Two strangers find themselves linked in a bizarre way. When a connection forms, will distance be the only thing to keep them apart?', '2016', '1h 46min', 'PG', 'Makoto Shinkai', 'AC007', NULL, NULL, NULL, 'https://www.example.com/your_name.jpg', '2016', '2021-05-10', 'movie'),
('MVS039', 'The Lives of Others', 'In 1984 East Berlin, an agent of the secret police, conducting surveillance on a writer and his lover, finds himself becoming increasingly absorbed by their lives.', '2006', '2h 17min', 'R', 'Florian Henckel von Donnersmarck', 'DR009', NULL, NULL, NULL, 'https://www.example.com/lives_others.jpg', '2006', '2021-05-10', 'movie'),
('MVS040', 'Amélie', 'Amélie is an innocent and naive girl in Paris with her own sense of justice. She decides to help those around her and, along the way, discovers love.', '2001', '2h 2min', 'R', 'Jean-Pierre Jeunet', 'DR010', NULL, NULL, NULL, 'https://www.example.com/amelie.jpg', '2001', '2021-05-10', 'movie');
COMMIT;