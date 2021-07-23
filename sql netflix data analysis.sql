USE netflix;
SELECT title, rating, country, release_year, director
FROM movies
WHERE director = 'Michael Bay'
ORDER by release_year ASC;

SELECT title, country, duration_in_minutes, date_added 
FROM movies
WHERE date_added < '2011-03-01'
ORDER BY duration_in_minutes ;

SELECT title, country, duration_in_minutes, release_year
FROM movies
WHERE release_year BETWEEN 2014 AND 2016
ORDER BY duration_in_minutes DESC;

SELECT title, director, country, duration_in_minutes
FROM movies
WHERE duration_in_minutes BETWEEN 180 AND 240
ORDER BY duration_in_minutes DESC;

SELECT title, director, rating, num_of_seasons
FROM series
WHERE num_of_seasons BETWEEN 10 AND 14
ORDER BY num_of_seasons DESC;

SELECT title, director, rating, num_of_seasons
FROM series
WHERE director IS NOT NULL 
AND num_of_seasons > 7;

SELECT title, director, cast, country, rating
FROM movies
WHERE cast LIKE '%Ryan Reynolds%';

SELECT title, director, cast, country, rating
FROM movies
WHERE cast LIKE '%Ryan Reynolds%'
AND cast LIKE '%Nicolas Cage%';

SELECT  title, director, cast, country, duration_in_minutes, rating
FROM movies
WHERE rating LIKE  '%PG%'
AND duration_in_minutes > 180;

SELECT  title, director, cast, country, release_year
FROM series
WHERE release_year IN(2014, 2016, 2018)
ORDER BY title;