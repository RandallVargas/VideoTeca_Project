CREATE PROCEDURE GetActorsByMovie
    @movieId VARCHAR(50)
AS
BEGIN
    SELECT a.actor_id, a.actor_first_name, a.actor_last_name, a.actor_img
    FROM Actors a
    INNER JOIN MovieActor ma ON a.actor_id = ma.actor_id
    INNER JOIN MoviesAndSeries ms ON ma.movie_id = ms.id
    WHERE ms.id = @movieId;
END;


EXEC GetActorsByMovie 'MVS002';