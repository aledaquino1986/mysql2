 -- /******Desafío 1*******/

 -- 1.
SELECT * FROM actors;
 -- -Gunn

 -- 2. 
SELECT title, awards FROM movies;
 -- -Parque

 -- 3. 
SELECT * from Movies 
Where title LIKE "%Titanic%";
 -- -320

 -- 4.
SELECT * FROM series
WHERE genre_id = 4;
 -- -4

 -- 5.

SELECT * FROM episodes
WHERE number = 2;
 -- -46

 -- /******Desafío 2*******/

 -- 1.

SELECT * FROM movies
WHERE release_date BETWEEN "1999-10-01" AND "2004-12-01";

 -- --Rey

 -- 2.
SELECT * FROM movies
WHERE title LIKE "%a";
 -- -Hotel

 -- 3.
SELECT count(FIRST_NAME) FROM actors
where first_name ="Jim";
 -- -3

 -- 4.
SELECT SUM(awards) AS "Premios de Star Wars" 
FROM movies
WHERE title LIKE "%La guerra%";
 -- -13

 -- 5.
SELECT concat(first_name, " ", last_name) AS "Actor", favorite_movie_id AS "Peli favorita", title from actors
INNER JOIN movies ON movies.id = actors.favorite_movie_id
WHERE first_name = "Leonardo";
 -- -de


/******Desafío 3*******/
 -- 1. 
SELECT concat(first_name, " ", last_name) AS "Actor", favorite_movie_id AS "Peli favorita", title from actors
INNER JOIN movies ON movies.id = actors.favorite_movie_id
WHERE actors.rating = 2.3;
 -- -Titanic

 -- 2.
SELECT series.title, series.genre_id, name FROM series
INNER JOIN genres ON genres.id = series.genre_id;
 -- -Fantasia 

 -- 3.

SELECT movies.title, movies.genre_id, name FROM movies
INNER JOIN genres ON genres.id = movies.genre_id
where name = "Animacion";
 -- -Intensamente

 -- 4.

SELECT CONCAT(first_name, " ", last_name) FROM actors
INNER JOIN actor_movie ON actor_movie.actor_id = actors.id
INNER JOIN movies ON  movies.id = actor_movie.movie_id
WHERE title LIKE "%Jurasico%";
 -- -Dern

 -- 5.

SELECT movies.title, movies.genre_id, name FROM movies
INNER JOIN genres ON genres.id = movies.genre_id
WHERE ranking BETWEEN 1 AND 4;

 -- -MI



/******Desafío 4*******/

 -- 1. 

SELECT 
    genres.name, 	
    AVG(movies.length) 
    FROM movies
INNER JOIN genres 
ON movies.genre_id = genres.id
GROUP BY genres.name
ORDER BY movIes.length DESC;

 -- Infantiles 

 -- 2. 

SELECT 
	CONCAT(first_name, " ", last_name) AS actor,
    COUNT(title) AS count 
    FROM actors
INNER JOIN actor_movie
ON actors.id = actor_movie.actor_id
INNER JOIN movies
ON movies.id = actor_movie.movie_id
GROUP BY actor
ORDER BY count DESC;

 -- --Emma

 -- 3.

SELECT genres.name, COUNT(genres.name) AS count FROM genres
INNER JOIN movies
ON movies.genre_id = genres.id
GROUP by genres.name
ORDER BY count;

 -- --Ciencia Ficción: 5

 -- 4.

SELECT genres.name, COUNT(genres.name) AS count FROM genres
INNER JOIN movies
ON movies.genre_id = genres.id
GROUP by genres.name
HAVING count >= 3;

 -- --Ciencia ficcion: 5


 -- 5.

SELECT genres.name, AVG(rating) as "Average" FROM genres
INNER JOIN movies
ON movies.genre_id = genres.id
WHERE movies.rating > 3
GROUP BY name;

 -- --Ciencia ficcion: 8



 -- Consultas SQL


-- SELECT
SELECT * FROM movies;
SELECT first_name, last_name, rating FROM actors;

-- Where, Order by

SELECT first_name, last_name FROM actors
WHERE rating > 7.5;

SELECT title, rating, awards FROM movies
WHERE rating > 7.5 AND awards > 2;

SELECT title, rating FROM movies
ORDER BY rating;

-- LIMIT, OFFSET

SELECT * FROM movies
limit 3;

SELECT * FROM movies
ORDER BY rating DESC
LIMIT 5;

SELECT * FROM movies
ORDER BY rating DESC
LIMIT 5
OFFSET 5;

-- BETWEEN, LIKE

SELECT title, rating FROM movies
WHERE title LIKE "%toy%";

SELECT * FROM movies
WHERE release_date BETWEEN '2004-01-01' AND '2008-12-31';

SELECT title, rating, awards FROM movies
WHERE awards >= 3 AND release_date BETWEEN "2000-01-01" AND "2009-12-31"
ORDER BY rating 
LIMIT 5
OFFSET 5;
