CREATE PROCEDURE SaveOrUpdateRating
    @movieSeriesId VARCHAR(50),
    @userId VARCHAR(50),
    @rating INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Ratings WHERE movie_series_id = @movieSeriesId AND user_id = @userId)
    BEGIN
        -- Actualizar la clasificación existente
        UPDATE Ratings
        SET rating = @rating
        WHERE movie_series_id = @movieSeriesId AND user_id = @userId
    END
    ELSE
    BEGIN
        -- Insertar una nueva clasificación
        INSERT INTO Ratings (movie_series_id, user_id, rating)
        VALUES (@movieSeriesId, @userId, @rating)
    END
END

CREATE PROCEDURE GetAverageRating
    @movieSeriesId VARCHAR(50)
AS
BEGIN
    SELECT AVG(rating) AS averageRating
    FROM Ratings
    WHERE movie_series_id = @movieSeriesId
END