Use Video_Teca_C13448_B98314

Create Table MoviesAndSeries(
id varchar(50) Primary Key,
title varchar(50),
synopsis varchar(200),
release_year date,
duration time,
clasification char(3),
director varchar(50),
num_seasons int,
num_episodes int,
episode_duration time,
movie_cover varchar(100),
year_of_release date,
date_addded date,
media_type VARCHAR(10) CHECK (media_type IN ('movie', 'series')),
FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);
ALTER TABLE MoviesAndSeries
DROP COLUMN genre_id;
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

Drop Procedure GetCommentsByMovieId
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


INSERT INTO MoviesAndSeries(id, title, synopsis, release_year, duration, clasification, director, genre_id, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)

VALUES ('MVS009', 'Black Panther', 'T challa, the newly crowned king of Wakanda, must defend his land from being torn apart by enemies from within and outside the country.', '2018-02-16', '02:14:00', 'TD', 'Ryan Coogler', 'Accion'