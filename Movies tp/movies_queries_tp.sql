use movies_db;

/*SELECT
Mostrar todos los registros de la tabla de movies.
Mostrar el nombre, apellido y rating de todos los actores.
Mostrar el título de todas las series.
Mostrar el título, rating y duración de la tabla movies. */

select * from movies;

select first_name, last_name, raring from actors; 

select title from series;

select title, rating length from movies;


/*WHERE Y ORDER BY
Mostrar el nombre y apellido de los actores cuyo rating sea mayor a 7,5.
Mostrar el título de las películas, el rating y los premios de las películas con un rating mayor a 7,5 y con más de dos premios.
Mostrar el título de las películas y el rating ordenadas por rating en forma ascendente.
Mostrar actores cuyo rating se encuentre entre 4.0 y 10.0.
Muestra los títulos y las fechas de lanzamiento de las películas cuya duración sea más de 150 minutos.*/

SELECT first_name, last_name, rating FROM actors
WHERE rating > 7.5;

SELECT title, rating, awards FROM movies
WHERE rating > 7.5 AND awards > 2 ;

SELECT title, rating FROM movies
ORDER BY rating asc;

SELECT first_name, last_name, rating FROM actors
WHERE rating between 4.0 and 10.0;

SELECT title, release_date, length FROM movies
WHERE length > 150;

/*BETWEEN y LIKE
Mostrar el título y rating de todas las películas cuyo título incluya Toy Story.
Mostrar a todos los actores cuyos nombres empiecen con Sam.
Muestra los nombres y apellidos de los actores ordenados por su rating de forma descendente.
Muestra los títulos y las fechas de lanzamiento de las películas ordenadas por su rating de forma descendente.
Muestra los nombres y apellidos de los actores cuyos nombres contienen la letra "a".
Mostrar el título de las películas que salieron entre el ‘2004-01-01’ y ‘2008-12-31’.*/

SELECT title, rating FROM movies
WHERE title LIKE "%Toy Story%";

SELECT first_name, last_name FROM actors
where first_name LIKE 'Sam%' ;

SELECT first_name, last_name, rating FROM actors
order by rating desc;

SELECT title, release_date, rating FROM movies
order by rating desc;

SELECT first_name, last_name FROM actors
where first_name LIKE '%a%';

SELECT title, release_date FROM movies
WHERE release_date between '2004-01-01' AND '2008-12-31';
