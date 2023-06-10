Use Video_Teca_C13448_B98314

Create Table MoviesAndSeries(
id varchar(50) Primary Key,
title varchar(50),
synopsis varchar(200),
release_year date,
duration time,
clasification char(3),
director varchar(50),
genre_id varchar(50),
num_seasons int,
num_episodes int,
episode_duration time,
movie_cover varchar(100),
year_of_release date,
date_addded date,
 media_type VARCHAR(10) CHECK (media_type IN ('movie', 'series')),
);

Create Table Ratings(
rating_id int,
movie_series_id varchar(50),
user_id varchar(50),
rating, 
);

Create Table Genres
(movies_series_id varchar(50) Primary Key,
genre_id varchar(50) 
 FOREIGN KEY (movies_series_id) REFERENCES MoviesAndSeries(movies_series_id),
 FOREIGN KEY (genre_id) REFERENCES MoviesAndSeries(genre_id)
);

Create Table Episodes(
episode_id int,
title varchar(50),
duration time,
episode_number int,
movie_series_id varchar(50)
FOREIGN KEY (movie_series_id) REFERENCES MoviesAndSeries(id),
);

Create Table Actors(
actor_id int Primary Key,
actor_first_name varchar(50),
actor_last_name varchar(50),
movies_series_id varchar(50)
FOREIGN KEY (movies_series_id) REFERENCES MoviesAndSeries(id),
);

CREATE TABLE Comments (
  comment_id VARCHAR(50) PRIMARY KEY,
  movie_series_id VARCHAR(50),
  userid int,
  comment VARCHAR(250),
  FOREIGN KEY (movie_series_id) REFERENCES MoviesAndSeries(id),
  FOREIGN KEY (userid) REFERENCES Users(id)
);

INSERT INTO MoviesAndSeries(id, title, synopsis, release_year, duration, clasification, director, genre_id, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)
VALUES ('MVS002', 'Captain America: The First Avenger', 'During World War II, Steve Rogers volunteers for an experimental program that turns him into the super soldier known as Captain America.',
'2011-07-22', '02:04:00', 'Td', 'Joe Johnston', 'Accion', 
NULL, NULL, NULL, 'https://es.web.img2.acsta.net/medias/nmedia/18/84/69/36/19774917.jpg', '2011', '2020-02-15', 'movie');

INSERT INTO MoviesAndSeries(id, title, synopsis, release_year, duration, clasification, director, genre_id, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)

VALUES ('MVS009', 'Black Panther', 'T challa, the newly crowned king of Wakanda, must defend his land from being torn apart by enemies from within and outside the country.', '2018-02-16', '02:14:00', 'TD', 'Ryan Coogler', 'Accion'