--Insert De Series 
INSERT INTO MoviesAndSeries (id, title, synopsis, release_year, duration, clasification, director, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)
VALUES ('MVS001', 'Stranger Things', 'Un grupo de amigos...', '2016-07-15', '00:50:00', '16+', 'The Duffer Brothers', 3, 25, '00:55:00', 'https://m.media-amazon.com/images/I/81PkURLEK1L.jpg', '2016-07-15', '2023-06-19', 'series');

-- Insertar episodios de la serie en la tabla Episodes
INSERT INTO Episodes (episode_id, title, duration, episode_number, season_number, movie_series_id)
VALUES ('ST101', 'The Vanishing of Will Byers', '00:55:00', 1, 1, 'MVS001');
INSERT INTO Episodes (episode_id, title, duration, episode_number, season_number, movie_series_id)
VALUES ('ST102', 'The Weirdo on Maple Street', '00:50:00', 2, 1, 'MVS001');
INSERT INTO Episodes (episode_id, title, duration, episode_number, season_number, movie_series_id)
VALUES ('ST103', 'Holly, Jolly', '00:52:00', 3, 1, 'MVS001');
INSERT INTO Episodes (episode_id, title, duration, episode_number, season_number, movie_series_id)
VALUES ('ST104', 'The Body', '00:49:00', 4, 1, 'MVS001');
INSERT INTO Episodes (episode_id, title, duration, episode_number, season_number, movie_series_id)
VALUES ('ST105', 'The Flea and the Acrobat', '00:50:00', 5, 1, 'MVS001');
INSERT INTO Episodes (episode_id, title, duration, episode_number, season_number, movie_series_id)
VALUES ('ST106', 'The Monster', '00:55:00', 6, 1, 'MVS001');
INSERT INTO Episodes (episode_id, title, duration, episode_number, season_number, movie_series_id)
VALUES ('ST107', 'The Bathtub', '00:50:00', 7, 1, 'MVS001');
INSERT INTO Episodes (episode_id, title, duration, episode_number, season_number, movie_series_id)
VALUES ('ST108', 'The Upside Down', '00:49:00', 8, 1, 'MVS001');
--------------------------------------------------------------------------------------------------
INSERT INTO Episodes (episode_id, title, duration, episode_number, season_number, movie_series_id)
VALUES ('ST201', 'MadMax', '00:50:00', 1, 2, 'MVS001');
INSERT INTO Episodes (episode_id, title, duration, episode_number, season_number, movie_series_id)
VALUES ('ST202', 'Trick or Treat, Freak', '00:55:00', 2, 2, 'MVS001');
INSERT INTO Episodes (episode_id, title, duration, episode_number, season_number, movie_series_id)
VALUES ('ST203', 'The Pollywog', '00:49:00', 3, 2, 'MVS001');
INSERT INTO Episodes (episode_id, title, duration, episode_number, season_number, movie_series_id)
VALUES ('ST204', 'Will the Wise', '00:50:00', 4, 2, 'MVS001');
INSERT INTO Episodes (episode_id, title, duration, episode_number, season_number, movie_series_id)
VALUES ('ST205', 'Dig Dug', '00:47:00', 5, 2, 'MVS001');
INSERT INTO Episodes (episode_id, title, duration, episode_number, season_number, movie_series_id)
VALUES ('ST206', 'The Spy', '00:52:00', 6, 2, 'MVS001');
INSERT INTO Episodes (episode_id, title, duration, episode_number, season_number, movie_series_id)
VALUES ('ST207', 'The Lost Sister', '00:45:00', 7, 2, 'MVS001');
INSERT INTO Episodes (episode_id, title, duration, episode_number, season_number, movie_series_id)
VALUES ('ST208', 'The Mind Flayer', '00:48:00', 8, 2, 'MVS001');
INSERT INTO Episodes (episode_id, title, duration, episode_number, season_number, movie_series_id)
VALUES ('ST209', 'The Gate', '00:57:00', 9, 2, 'MVS001');


INSERT INTO MovieGenre (movie_id, genre_id)
VALUES ('MVS001', '4'); -- Género: Drama
INSERT INTO MovieGenre (movie_id, genre_id)
VALUES ('MVS001', '5'); -- Género: Ciencia ficción


INSERT INTO Actors (actor_id, actor_first_name, actor_last_name, actor_img)
VALUES (8, 'Millie', 'Bobby Brown', 'https://hips.hearstapps.com/hmg-prod/images/millie-bobby-brown-botox-1652847710.jpg');
INSERT INTO Actors (actor_id, actor_first_name, actor_last_name, actor_img)
VALUES (7, 'Finn', 'Wolfhard', 'https://image.tmdb.org/t/p/w500/5OVmquAk0W5BIsRlVKslEP497JD.jpg');

INSERT INTO Actors (actor_id, actor_first_name, actor_last_name, actor_img)
VALUES (9, 'Gaten', 'Matarazzo', 'https://www.formulatv.com/images/articulos/116000/116370_VL14tmaz8Y05Pgx3cU9oJse27iH6kFNWB-h2.jpg');
INSERT INTO Actors (actor_id, actor_first_name, actor_last_name, actor_img)
VALUES (10, 'Caleb', 'McLaughlin', 'ruta/imagen/caleb_mclaughlin.jpg');


INSERT INTO MovieActor(movie_id, actor_id)
VALUES ('MVS001', '9');