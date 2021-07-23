-- SPOTIFY DATA ANALYSIS
USE spotify;
SELECT artist, COUNT(*) AS 'number_of_tracks'
FROM tracks
GROUP BY artist
ORDER BY COUNT(*) DESC;

SELECT genre, AVG(duration) AS 'avg_track_duration'
FROM tracks
GROUP BY genre
ORDER BY AVG(duration) DESC;

SELECT artist, MIN(danceability), MAX(danceability), AVG(danceability)
FROM tracks
WHERE artist IN ('Queen', 'The Beatles')
GROUP BY artist;

SELECT COUNT(DISTINCT genre)  AS 'unique_pop_genres'
FROM tracks
WHERE genre LIKE '%pop%';

SELECT  artist, COUNT(title) AS 'number_of_tracks', MAX(popularity), MIN(popularity)
FROM tracks
GROUP BY artist;

SELECT genre, COUNT(title) AS 'number_of_tracks', release_year
FROM tracks
WHERE release_year BETWEEN 2005 AND 2010
GROUP BY genre;

SELECT genre, COUNT(title) AS 'number_of_tracks', release_year
FROM tracks
WHERE release_year BETWEEN 2005 AND 2010
GROUP BY genre
HAVING COUNT(title) > 10;

SELECT artist,genre, release_year, COUNT(title) AS 'number_of_tracks' 
FROM tracks
WHERE artist = 'Coldplay'
GROUP BY release_year
ORDER BY release_year ASC;

