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
ALTER TABLE MoviesAndSeries


ALTER TABLE MoviesAndSeries
ALTER COLUMN synopsis varchar(500);
CREATE TABLE MovieGenre (
  movie_and_serie_id VARCHAR(50),
  genre_id VARCHAR(50),
  FOREIGN KEY (movie_and_serie_id) REFERENCES MoviesAndSeries(id),
  FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);
Create Table Ratings(
 rating_id INT IDENTITY(1,1) PRIMARY KEY,
movie_series_id varchar(50),
user_id varchar(50),
rating int, 
 FOREIGN KEY (movie_series_id) REFERENCES MoviesAndSeries(id),
);
Use Video_Teca_C13448_B98314
Drop table  Ratings

Insert into MovieGenre(movie_id,genre_id)
values('MVS002', 1)
Insert into MovieGenre(movie_id,genre_id)
values('MVS002', 5)
Create Table Episodes(
episode_id varchar(50),
title varchar(50),
duration time,
episode_number int,
movie_series_id varchar(50)
FOREIGN KEY (movie_series_id) REFERENCES MoviesAndSeries(id),
);
drop table Episodes
ALTER TABLE Episodes
ADD season_number INT;
CREATE TABLE Actors (
    actor_id INT PRIMARY KEY,
    actor_first_name VARCHAR(50),
    actor_last_name VARCHAR(50),
    actor_img VARCHAR(500)
);

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
  comment VARCHAR(max),
  Username varchar(30)
  FOREIGN KEY (movie_series_id) REFERENCES MoviesAndSeries(id),
  FOREIGN KEY (userid) REFERENCES Users(id)
);
drop table Comments
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

Use Video_Teca_C13448_B98314
Delete from Actors
INSERT INTO Actors (actor_id, actor_first_name, actor_last_name, actor_img) 
VALUES (1, 'Chris', 'Evans', 'https://media.revistavanityfair.es/photos/60e8605006a9cde9aea6d749/master/w_1600%2Cc_limit/45447.jpg');

INSERT INTO Actors (actor_id, actor_first_name, actor_last_name, actor_img) 
VALUES (2, 'Hayley', 'Atwell', 'https://img.wegreenkw.com/sites/3/2023/03/Hayley-Atwell.webp');

INSERT INTO Actors (actor_id, actor_first_name, actor_last_name, actor_img) 
VALUES (3, 'Sebastian', 'Stan', 'https://images.mubicdn.net/images/cast_member/15647/cache-120716-1600344240/image-w856.jpg');

INSERT INTO Actors (actor_id, actor_first_name, actor_last_name, actor_img) 
VALUES (4, 'Tommy', 'Lee Jones', 'https://es.web.img2.acsta.net/r_1280_720/pictures/18/02/28/11/42/1899408.jpg');

INSERT INTO Actors (actor_id, actor_first_name, actor_last_name, actor_img) 
VALUES (5, 'Hugo', 'Weaving', 'https://flxt.tmsimg.com/assets/27163_v9_bb.jpg');

INSERT INTO Actors (actor_id, actor_first_name, actor_last_name, actor_img) 
VALUES (6, 'Dominic', 'Cooper', 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/kYSnlEahZCwHprsWtOO0OJB346P.jpg');


INSERT INTO MovieActor(movie_id, actor_id) VALUES

('MVS003', '1')

DELETE FROM MovieActor
WHERE movie_id = 'MVS003' AND actor_id = '1';
INSERT INTO MovieActor(movie_id, actor_id) VALUES

('MVS002', '2')

INSERT INTO MovieActor(movie_id, actor_id) VALUES

('MVS002', '3')

INSERT INTO MovieActor(movie_id, actor_id) VALUES

('MVS002', '4')

INSERT INTO MovieActor(movie_id, actor_id) VALUES

('MVS002', '5')

INSERT INTO MovieActor(movie_id, actor_id) VALUES

('MVS002', '6')



INSERT INTO MoviesAndSeries(id, title, synopsis, release_year, duration, clasification, director, genre_id, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)
VALUES ('MVS002', 'Captain America: The First Avenger', 'During World War II, Steve Rogers volunteers for an experimental program that turns him into the super soldier known as Captain America.',
'2011-07-22', '02:04:00', 'Td', 'Joe Johnston', 'Accion', 
NULL, NULL, NULL, 'https://es.web.img2.acsta.net/medias/nmedia/18/84/69/36/19774917.jpg', '2011', '2020-02-15', 'movie');

INSERT INTO MoviesAndSeries (id, title, synopsis, release_year, duration, clasification, director, genre_id, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)
VALUES ('MVS003', 'Captain America: The Winter Soldier', 'After the cataclysmic events in New York with The Avengers, Steve Rogers, aka Captain America, lives quietly in Washington, D.C. ',
'2014-04-04', '02:16:00', 'TD', 'Anthony Russo, Joe Russo', 'Accion',
NULL, NULL, NULL, 'https://es.web.img3.acsta.net/pictures/14/01/31/16/12/220933.jpg', '2014', '2021-06-10', 'movie');




INSERT INTO MoviesAndSeries (id, title, synopsis, release_year, duration, clasification, director,  num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)
VALUES ('MVS007', 'Batman: The Dark Knight', 'When the menace known as The Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.', '2008-07-18', '02:32:00', 'Td', 'Christopher Nolan',  NULL, NULL, NULL, 'https://larepublica.cronosmedia.glr.pe/migration/images/TLBIGOIGTFGCBIU4TECGW7KOLA.jpg', '2008', '2020-02-15', 'movie');
Insert into MovieGenre(movie_id,genre_id)
values('MVS007', 1)
Insert into MovieGenre(movie_id,genre_id)
values('MVS007', 2)
INSERT INTO MoviesAndSeries (id, title, synopsis, release_year, duration, clasification, director, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)
VALUES ('MVS004', 'Avengers: Endgame', 'After the devastating events of Avengers: Infinity War, the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos actions and restore balance to the universe.', '2019-04-26', '03:01:00', 'Td', 'Anthony Russo, Joe Russo',  NULL, NULL, NULL, 'https://cloudfront-us-east-1.images.arcpublishing.com/gruponacion/3ETZFNFIUBDTZH5ZT52MNNTINY.jpg', '2019', '2020-02-15', 'movie');
	
	INSERT INTO MoviesAndSeries (id, title, synopsis, release_year, duration, clasification, director, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)
VALUES ('MVS0010', 'Inception', 'Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible: "inception", the implantation of another person`s idea into a target`s subconscious.', '2010-07-16', '02:28:00', 'PG13', 'Christopher Nolan', NULL, NULL, NULL, 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/edv5CZvWj09upOsy2Y6IwDhK8bt.jpg', '2010-07-10', '2021-03-13', 'movie');
		
		INSERT INTO MoviesAndSeries (id, title, synopsis, release_year, duration, clasification, director, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)
VALUES('MVS0011', 'The Shawshank Redemption', 'Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.', '1994-09-23', '02:22:00', 'R', 'Frank Darabont', NULL, NULL, NULL, 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/lyQBXzOQSuE59IsHyhrp0qIiPAz.jpg', '1994-09-15', '2022-06-13', 'movie');
	
	INSERT INTO MoviesAndSeries (id, title, synopsis, release_year, duration, clasification, director, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)
VALUES('MVS0012', 'Pulp Fiction', 'A burger-loving hit man, his philosophical partner, a drug-addled gangster`s moll and a washed-up boxer converge in this sprawling, comedic crime caper. Their adventures unfurl in three stories that ingeniously trip back and forth in time.', '1994-10-14', '02:34:00', 'R', 'Quentin Tarantino', NULL, NULL, NULL, 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg', '1994-10-10', '2021-06-16', 'movie');
		
		INSERT INTO MoviesAndSeries (id, title, synopsis, release_year, duration, clasification, director, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)
VALUES('MVS0013', 'Fight Club', 'A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground "fight clubs" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.', '1999-10-15', '02:19:00', 'R', 'David Fincher', NULL, NULL, NULL, 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg', '1999-10-10', '2019-06-6', 'movie');
	
	
	INSERT INTO MoviesAndSeries (id, title, synopsis, release_year, duration, clasification, director, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)
VALUES
	('MVS0014', 'The Godfather', 'Synopsis of The Godfather', '1972-03-24', '02:55:00', 'R', 'Francis Ford Coppola', NULL, NULL, NULL, 'https://example.com/cover6.jpg', '1972-03-20', '2022-06-13', 'movie'),
		('MVS0015', 'The Matrix', 'Synopsis of The Matrix', '1999-03-31', '02:16:00', 'R', 'Lana Wachowski, Lilly Wachowski', NULL, NULL, NULL, 'https://example.com/cover7.jpg', '1999-03-25', '2022-06-13', 'movie'),
		('MVS0016', 'Forrest Gump', 'Synopsis of Forrest Gump', '1994-07-06', '02:22:00', 'PG-13', 'Robert Zemeckis', NULL, NULL, NULL, 'https://example.com/cover8.jpg', '1994-07-01', '2022-06-13', 'movie'),
		('MVS0017', 'Goodfellas', 'Synopsis of Goodfellas', '1990-09-19', '02:26:00', 'R', 'Martin Scorsese', NULL, NULL, NULL, 'https://example.com/cover9.jpg', '1990-09-15', '2022-06-13', 'movie'),
		('MVS0018', 'The Silence of the Lambs', 'Synopsis of The Silence of the Lambs', '1991-02-14', '01:58:00', 'R', 'Jonathan Demme', NULL, NULL, NULL, 'https://example.com/cover10.jpg', '1991-02-10', '2022-06-13', 'movie'),
		('MVS0019', 'The Departed', 'Synopsis of The Departed', '2006-10-06', '02:31:00', 'R', 'Martin Scorsese', NULL, NULL, NULL, 'https://example.com/cover11.jpg', '2006-10-01', '2022-06-13', 'movie'),
		('MVS0020', 'The Green Mile', 'Synopsis of The Green Mile', '1999-12-10', '03:09:00', 'R', 'Frank Darabont', NULL, NULL, NULL, 'https://example.com/cover12.jpg', '1999-12-05', '2022-06-13', 'movie'),
		('MVS0021', 'The Lord of the Rings: The Fellowship of the Ring', 'Synopsis of The Fellowship of the Ring', '2001-12-19', '02:58:00', 'PG-13', 'Peter Jackson', NULL, NULL, NULL, 'https://example.com/cover13.jpg', '2001-12-15', '2022-06-13', 'movie'),
		('MVS0022', 'The Lion King', 'Synopsis of The Lion King', '1994-06-24', '01:28:00', 'G', 'Roger Allers, Rob Minkoff', NULL, NULL, NULL, 'https://example.com/cover14.jpg', '1994-06-20', '2022-06-13', 'movie'),
		('MVS0023', 'The Avengers', 'Synopsis of The Avengers', '2012-05-04', '02:23:00', 'PG-13', 'Joss Whedon', NULL, NULL, NULL, 'https://example.com/cover15.jpg', '2012-04-30', '2022-06-13', 'movie'),
		('MVS0024', 'Interstellar', 'Synopsis of Interstellar', '2014-11-07', '02:49:00', 'PG-13', 'Christopher Nolan', NULL, NULL, NULL, 'https://example.com/cover16.jpg', '2014-11-01', '2022-06-13', 'movie'),
		('MVS0025', 'The Dark Knight Rises', 'Synopsis of The Dark Knight Rises', '2012-07-20', '02:44:00', 'PG-13', 'Christopher Nolan', NULL, NULL, NULL, 'https://example.com/cover17.jpg', '2012-07-15', '2022-06-13', 'movie'),
		('MVS0026', 'The Prestige', 'Synopsis of The Prestige', '2006-10-20', '02:10:00', 'PG-13', 'Christopher Nolan', NULL, NULL, NULL, 'https://example.com/cover18.jpg', '2006-10-15', '2022-06-13', 'movie'),
		('MVS0027', 'Gladiator', 'Synopsis of Gladiator', '2000-05-05', '02:35:00', 'R', 'Ridley Scott', NULL, NULL, NULL, 'https://example.com/cover19.jpg', '2000-05-01', '2022-06-13', 'movie'),
		('MVS0028', 'The Godfather: Part II', 'Synopsis of The Godfather: Part II', '1974-12-20', '03:22:00', 'R', 'Francis Ford Coppola', NULL, NULL, NULL, 'https://example.com/cover20.jpg', '1974-12-15', '2022-06-13', 'movie'),
		('MVS0029', 'The Wolf of Wall Street', 'Synopsis of The Wolf of Wall Street', '2013-12-25', '03:00:00', 'R', 'Martin Scorsese', NULL, NULL, NULL, 'https://example.com/cover21.jpg', '2013-12-20', '2022-06-13', 'movie'),
		('MVS0030', 'Schindler`s List', 'Synopsis of Schindler`s List', '1993-12-15', '03:15:00', 'R', 'Steven Spielberg', NULL, NULL, NULL, 'https://example.com/cover22.jpg', '1993-12-10', '2022-06-13', 'movie'),
		('MVS0031', 'The Revenant', 'Synopsis of The Revenant', '2015-12-25', '02:36:00', 'R', 'Alejandro González Iñárritu', NULL, NULL, NULL, 'https://example.com/cover23.jpg', '2015-12-20', '2022-06-13', 'movie'),
		('MVS0032', 'The Social Network', 'Synopsis of The Social Network', '2010-10-01', '02:00:00', 'PG-13', 'David Fincher', NULL, NULL, NULL, 'https://example.com/cover24.jpg', '2010-09-25', '2022-06-13', 'movie'),
		('MVS0033', 'Inglourious Basterds', 'Synopsis of Inglourious Basterds', '2009-08-21', '02:33:00', 'R', 'Quentin Tarantino', NULL, NULL, NULL, 'https://example.com/cover25.jpg', '2009-08-15', '2022-06-13', 'movie'),
    
INSERT INTO MovieGenre(movie_id, genre_id) VALUES

('MVS0010', '2'),
('MVS0010', '5'),
('MVS0010', '1');
					--1', 'Action'
INSERT INTO MovieGenre(movie_id, genre_id) VALUES					--'2', 'Adventure');
('MVS0011', '4'),
('MVS0011', '4'),
					--3', 'Comedy');
					--4', 'Drama');
('MVS0012', '6'),
('MVS0012', '4'),
					--5', 'Science Fiction');
('MVS0013', '3'),
('MVS0013', '6'),
('MVS0013', '4');

('MVS0014', '6'),
('MVS0015', '7'),
('MVS0016', '8'),
('MVS0017', '9'),
('MVS0018', '10'),
('MVS0019', '1'),
('MVS0020', '2'),
('MVS0021', '3'),
('MVS0022', '4'),
('MVS0023', '5'),
('MVS0024', '6'),
('MVS0025', '7'),--6', 'Thriller');
('MVS0026', '8'),
('MVS0027', '9'),--7', 'Romance');
('MVS0028', '10'),--10', 'Documentary');
('MVS0029', '1'),
('MVS0030', '2'),--8', 'Animation');
('MVS0031', '3'),
('MVS0032', '4'),--9', 'Fantasy');
('MVS0033', '5');












