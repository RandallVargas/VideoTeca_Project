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

Select *FROM ACTORS
INSERT INTO MovieActor(movie_id, actor_id)
VALUES ('MVS001', '9');

Use Video_Teca_C13448_B98314
INSERT INTO MoviesAndSeries (id, title, synopsis, release_year, duration, clasification, director, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)
VALUES
('MVS0020', 'Inside Out', 'Growing up can be a bumpy road, and it`s no exception for Riley, who is uprooted from her Midwest life when her father starts a new job in San Francisco. Like all of us, Riley is guided by her emotions - Joy, Fear, Anger, Disgust, and Sadness.elp advise her through everyday life.', '2015-05-09', '01:35:00', 'PG', 'Pete Docter', NULL, NULL, NULL, 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/2H1TmgdfNtsKlU9jKdeNyYL5y8T.jpg', '2015-06-05', '2021-06-16', 'movie')

('MVS0014', 'Toy Story', 'A cowboy doll is profoundly threatened and jealous when a new spaceman figure supplants him as top toy in a boy`s room.', '1995-11-22', '01:21:00', 'G', 'John Lasseter', NULL, NULL, NULL, 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/uXDfjJbdP4ijW5hWSBrPrlKpxab.jpg', '1995-11-19', '2021-06-16', 'movie'),

('MVS0015', 'Finding Nemo', 'Nemo, an adventurous young clownfish, is unexpectedly taken from his Great Barrier Reef home to a dentist`s office aquarium. It`s up to his worrisome father Marlin and a friendly but forgetful fish Dory to bring Nemo home -- meeting vegetarian sharks, surfer dude turtles, hypnotic jellyfish, hungry seagulls, and more along the way.', '2003-05-30', '01:40:00', 'G', 'Andrew Stanton', NULL, NULL, NULL, 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/eHuGQ10FUzK1mdOY69wF5pGgEf5.jpg', '2003-05-26', '2021-06-16', 'movie'),

('MVS0016', 'The Incredibles', 'Bob Parr has given up his superhero days to log in time as an insurance adjuster and raise his three children with his formerly heroic wife in suburbia. But when he receives a mysterious assignment, it`s time to get back into costume.', '2004-11-05', '01:55:00', 'PG', 'Brad Bird', NULL, NULL, NULL, 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/2LqaLgk4Z226KkgPJuiOQ58wvrm.jpg', '2004-11-01', '2021-06-16', 'movie'),

('MVS0017', 'Up', 'Carl Fredricksen spent his entire life dreaming of exploring the globe and experiencing life to its fullest. But at age 78, life seems to have passed him by, until a twist of fate (and a persistent 8-year-old Wilderness Explorer named Russell) gives him a new lease on life.', '2009-05-13', '01:36:00', 'PG', 'Pete Docter', NULL, NULL, NULL, 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/mFvoEwSfLqbcWwFsDjQebn9bzFe.jpg', '2009-05-09', '2021-06-16', 'movie'),

('MVS0018', 'Toy Story 3', 'Woody, Buzz, and the rest of Andy`s toys haven`t been played with in years. With Andy about to go to college, the gang find themselves accidentally left at a nefarious day care center. The toys must band together to escape and return home to Andy.', '2010-06-17', '01:43:00', 'G', 'Lee Unkrich', NULL, NULL, NULL, 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/AbbXspMOwdvwWZgVN0nabZq03Ec.jpg', '2010-06-13', '2021-06-16', 'movie'),

('MVS0019', 'Frozen', 'Young princess Anna of Arendelle dreams about finding true love at her sister Elsa`s coronation. Fate takes her on a dangerous journey in an attempt to end the eternal winter that has fallen over the kingdom. She`s accompanied by ice delivery man Kristoff, his reindeer Sven, and snowman Olaf. On an adventure where she will find out what friendship, courage, family, and true love really means.', '2013-11-27', '01:42:00', 'PG', 'Chris Buck, Jennifer Lee', NULL, NULL, NULL, 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/kgwjIb2JDHRhNk13lmSxiClFjVk.jpg', '2013-11-23', '2021-3-30', 'movie'),

('MVS0021', 'Zootopia', 'Determined to prove herself, Officer Judy Hopps, the first bunny on Zootopia`s police force, jumps at the chance to crack her first case - even if it means partnering with scam-artist fox Nick Wilde to solve the mystery.', '2016-02-11', '01:49:00', 'PG', 'Byron Howard, Rich Moore', NULL, NULL, NULL, 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hlK0e0wAQ3VLuJcsfIYPvb4JVud.jpg', '2016-02-07', '2021-06-16', 'movie'),

('MVS0022', 'Coco', 'Despite his family`s baffling generations-old ban on music, Miguel dreams of becoming an accomplished musician like his idol, Ernesto de la Cruz. Desperate to prove his talent, Miguel finds himself in the stunning and colorful Land of the Dead following a mysterious chain of events. Along the way, he meets charming trickster Hector, and together, they set off on an extraordinary journey to unlock the real story behind Miguel`s family history.', '2017-10-27', '01:45:00', 'PG', 'Lee Unkrich, Adrian Molina', NULL, NULL, NULL, 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/gGEsBPAijhVUFoiNpgZXqRVWJt2.jpg', '2017-10-23', '2021-06-17', 'movie'),

('MVS0023', 'Frozen II', 'Elsa, Anna, Kristoff, and Olaf head far into the forest to learn the truth about an ancient mystery of their kingdom.', '2019-11-20', '01:44:00', 'PG', 'Chris Buck, Jennifer Lee', NULL, NULL, NULL, 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/mINJaa34MtknCYl5AjtNJzWj8cD.jpg', '2019-11-15', '2021-06-16', 'movie'),

('MVS0024', 'Soul', 'Joe Gardner is a middle school teacher with a love for jazz music. After a successful gig at the Half Note Club, he suddenly gets into an accident that separates his soul from his body and is transported to the You Seminar, a center in which souls develop and gain passions before being transported to a newborn child. Joe must enlist help from the other souls-in-training, like 22, a soul who has spent eons in the You Seminar, in order to get back to Earth.', '2020-12-25', '01:47:00', 'PG', 'Pete Docter, Kemp Powers', NULL, NULL, NULL, 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hm58Jw4Lw8OIeECIq5qyPYhAeRJ.jpg', '2020-12-21', '2021-06-16', 'movie');

INSERT INTO MovieGenre (movie_id, genre_id)
VALUES ('MVS0014', '8');--Animation
--Toy Story
INSERT INTO MovieActor(movie_id, actor_id)
VALUES ('MVS0014', '29');
INSERT INTO MovieActor(movie_id, actor_id)
VALUES ('MVS0014', '30');

INSERT INTO MovieGenre (movie_id, genre_id)
VALUES ('MVS0015', '8');--Animation
--Finding Nemo
INSERT INTO MovieActor(movie_id, actor_id)
VALUES ('MVS0015', '15');
INSERT INTO MovieActor(movie_id, actor_id)
VALUES ('MVS0015', '16');

INSERT INTO MovieGenre (movie_id, genre_id)
VALUES ('MVS0016', '8');--Animation
--The Incredibles


INSERT INTO MovieActor(movie_id, actor_id)
VALUES ('MVS0016', '17');
INSERT INTO MovieActor(movie_id, actor_id)
VALUES ('MVS0016', '18');

INSERT INTO MovieGenre (movie_id, genre_id)
VALUES ('MVS0017', '8');--Animation
--up
INSERT INTO MovieActor(movie_id, actor_id)
VALUES ('MVS0017', '31');
INSERT INTO MovieActor(movie_id, actor_id)
VALUES ('MVS0017', '32');
-----------Faltaaaaaaaaaaaaaa-----------------
INSERT INTO MovieGenre (movie_id, genre_id)
VALUES ('MVS0018', '8');--Animation
---
INSERT INTO MovieActor(movie_id, actor_id)
VALUES ('MVS018', '');
INSERT INTO MovieActor(movie_id, actor_id)
VALUES ('MVS018', '');

INSERT INTO MovieGenre (movie_id, genre_id)
VALUES ('MVS0019', '8');--Animation
INSERT INTO MovieGenre (movie_id, genre_id)
VALUES ('MVS0020', '8');--Animation
INSERT INTO MovieGenre (movie_id, genre_id)
VALUES ('MVS0021', '8');--Animation
INSERT INTO MovieGenre (movie_id, genre_id)
VALUES ('MVS0022', '8');--Animation
INSERT INTO MovieGenre (movie_id, genre_id)
VALUES ('MVS0023', '8');--Animation
INSERT INTO MovieGenre (movie_id, genre_id)
VALUES ('MVS0024', '8');--Animation



-- Actores de Finding Nemo
INSERT INTO Actors (actor_first_name, actor_last_name, actor_img)
VALUES ('Albert', 'Brooks', 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/8iDSGu5l93N7benjf6b3AysBore.jpg'),
       ('Ellen', 'DeGeneres', 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/z8IEEid4z63CBlJtxrTKEfsW7NA.jpg')


-- Actores de The Incredibles
INSERT INTO Actors ( actor_first_name, actor_last_name, actor_img)
VALUES ( 'Craig', 'T. Nelson', 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/rMh8qdexFKmc7mq7oLzsLLvCCjs.jpg'),
       ( 'Holly', 'Hunter', 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/kC7KX03VAWvogOCuwKbMo4V6TuU.jpg')
     

-- Actores de Toy Story 2
INSERT INTO Actors ( actor_first_name, actor_last_name, actor_img)
VALUES ('Tom', 'Hanks', 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/xndWFsBlClOJFRdhSt4NBwiPq2o.jpg'),
       ( 'Tim', 'Allen', 'https://www.themoviedb.org/person/12898-tim-allen?language=es-es')
      


-- Actores de Coco
INSERT INTO Actors (actor_first_name, actor_last_name, actor_img)
VALUES ( 'Anthony', 'Gonzalez', 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/3SfBmj35OfL8eVIQt9nTixWqVJH.jpg'),
       ( 'Gael', 'García Bernal', 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/7mq3EQN1oJfYNXkv9xKXKu6Ccw5.jpg'),
       ( 'Benjamin', 'Bratt', 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/hBenHPT4iJEG2kt5z2TOGnkRZwh.jpg'),
       ( 'Alanna', 'Ubach', 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/p2sIpgftEIkhPrrpgu8wW8XEpDg.jpg'),
       ( 'Renée', 'Victor', 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/wAVDqwFhQsRQgO6VIYq6T9Wbbx8.jpg');

-- Actores de Frozen II
INSERT INTO Actors ( actor_first_name, actor_last_name, actor_img)
VALUES ( 'Kristen', 'Bell', 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/rP74dJXl7EjinGM0shQtUOlH5s2.jpg'),
       ( 'Idina', 'Menzel', 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/l2N0xOzHqZ75bKXBCciKwBdwxcN.jpg'),
       ( 'Jonathan', 'Groff', 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/3kmnYKAzSc3Lp7iK5pcj97Hx9Cm.jpg'),
       ( 'Josh', 'Gad', 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/17iKlfWZBDTAucqjkhRKHr9xjIz.jpg'),
       ('Santino', 'Fontana', 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/5wo0D9drLtLwdyZyDqNZRejgzoM.jpg');

-- Actores de Soul
INSERT INTO Actors ( actor_first_name, actor_last_name, actor_img)
VALUES ( 'Jamie', 'Foxx', 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/zD8Nsy4Xrghp7WunwpCj5JKBPeU.jpg'),
       ( 'Tina', 'Fey', 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/yPTAi1iucXf85UpiFPtyiTSM6do.jpg'),
       ( 'Graham', 'Norton', 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/2VLkmia1Nd6r78WM5vWDgIIVsDF.jpg'),
       ( 'Rachel', 'House', 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/m8D9XlTGfI0ZmauMKtYp5tw8eNi.jpg'),
       ( 'Alice', 'Braga', 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/ykVmsm3For9dCBfWLRtTL0EU24b.jpg')

	   INSERT INTO Actors ( actor_first_name, actor_last_name, actor_img)
VALUES ('Ed','Fredricksen','https://www.themoviedb.org/t/p/w300_and_h450_bestv2/i9Akq9tqNwgcAc63QaSaiTYZtUB.jpg'),
		('Cristopher','Plummer','https://www.themoviedb.org/t/p/w300_and_h450_bestv2/iZh3s9Vy9vYD4DYnAda6C1kdeco.jpg')


		INSERT INTO MoviesAndSeries(id, title, synopsis, release_year, duration, clasification, director, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)
VALUES ('ROM001', 'Eternal Sunshine of the Spotless Mind', 'Joel Barish, desconsolado por su reciente ruptura, decide someterse a un procedimiento médico experimental para borrar todos los recuerdos de su exnovia, Clementine. A medida que los recuerdos comienzan a desvanecerse, Joel se da cuenta de que todavía está enamorado de Clementine y lucha por detener el proceso.', '2004-01-01', '01:48:00', 'R', 'Michel Gondry', NULL, NULL, NULL, 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/5MwkWH9tYHv3mV9OdYTMR5qreIz.jpg', '2023-01-01', '2023-06-23', 'movie');

INSERT INTO MoviesAndSeries (id, title, synopsis, release_year, duration, clasification, director, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)
VALUES ('ROM002', '500 Days of Summer', 'La película sigue la historia de Tom Hansen, un romántico empedernido, y Summer Finn, una mujer que no cree en el amor. La historia se desarrolla en 500 días, explorando los altibajos de su relación y las expectativas románticas de Tom.', '2009-01-01', '01:35:00', 'PG-13', 'Marc Webb', NULL, NULL, NULL, 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/f9mbM0YMLpYemcWx6o2WeiYQLDP.jpg', '2023-01-01', '2023-06-23', 'movie');

INSERT INTO MovieGenre (movie_id, genre_id)
VALUES ('ROM001', '7');
INSERT INTO MovieGenre (movie_id, genre_id)
VALUES ('ROM002', '7');--Animation
Use Video_Teca_C13448_B98314


INSERT INTO MoviesAndSeries (id, title, synopsis, release_year, duration, clasification, director, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)
VALUES ('FAN001', 'El laberinto del fauno', 'En la España de 1944, durante la posguerra, una niña llamada Ofelia se adentra en un laberinto mágico donde se enfrenta a criaturas fantásticas y oscuros desafíos. Con el fin de escapar de la realidad cruel de su vida, Ofelia debe completar tres peligrosas tareas.', '2006-10-11', '01:58:00', 'R', 'Guillermo del Toro', NULL, NULL, NULL, 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/s8C4whhKtDaJvMDcyiMvx3BIF5F.jpg', '2023-01-01', '2023-06-23', 'movie');

INSERT INTO MoviesAndSeries (id, title, synopsis, release_year, duration, clasification, director, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)
VALUES ('FAN002', 'El Señor de los Anillos: La Comunidad del Anillo', 'Frodo Baggins, un hobbit de la Tierra Media, emprende un peligroso viaje para destruir el Anillo Único y evitar que caiga en manos del Señor Oscuro Sauron. Con la ayuda de una comunidad de seres mágicos y guerreros, Frodo se enfrenta a numerosos desafíos en su misión épica.', '2001-12-19', '02:58:00', 'PG-13', 'Peter Jackson', NULL, NULL, NULL, 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg', '2023-01-01', '2023-06-23', 'movie');



INSERT INTO MovieGenre (movie_id, genre_id)
VALUES ('FAN001', '9');
INSERT INTO MovieGenre (movie_id, genre_id)
VALUES ('FAN002', '9');--Animation

INSERT INTO MoviesAndSeries (id, title, synopsis, release_year, duration, clasification, director, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)
VALUES ('DOC001', 'Blackfish', 'Blackfish is a documentary that examines the lives of captive orcas and exposes the ethical and safety issues associated with their training and exhibition in water parks. Through interviews and testimonies from trainers and experts, the documentary reveals the shocking reality of the marine theme park industry.', '2013-07-19', '01:23:00', 'PG-13', 'Gabriela Cowperthwaite', NULL, NULL, NULL, 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/kCk4mDFE96Mn1AYfEcbxkIiw7ND.jpg', '2023-01-01', '2023-06-23', 'movie');

INSERT INTO MoviesAndSeries (id, title, synopsis, release_year, duration, clasification, director, num_seasons, num_episodes, episode_duration, movie_cover, year_of_release, date_addded, media_type)
VALUES ('DOC002', 'The Cove', 'The Cove is a documentary that follows a group of activists who embark on an undercover mission to expose dolphin hunting in Taiji, Japan. As they unveil the dark secrets of the industry, they face dangers and challenges to document the brutality of this practice and raise awareness about its impact on marine life.', '2009-07-31', '01:32:00', 'PG-13', 'Louie Psihoyos', NULL, NULL, NULL, 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/enQGYgQg8mEhkZnY2g9iEwH9qvZ.jpg', '2023-01-01', '2023-06-23', 'movie');

INSERT INTO MovieGenre (movie_id, genre_id)
VALUES ('DOC001', '10');
INSERT INTO MovieGenre (movie_id, genre_id)
VALUES ('DOC002', '10');


