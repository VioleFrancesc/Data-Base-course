use movies_db;

/*Consultas
SUBQUERIES Y TABLE REFERENCE
Utilizando la base de datos de movies, queremos conocer, por un lado, los títulos y el nombre del género de todas las series de la base de datos.
Por otro, necesitamos listar los títulos de los episodios junto con el nombre y apellido de los actores que trabajan en cada uno de ellos.
#Para nuestro próximo desafío, necesitamos obtener a todos los actores o actrices (mostrar nombre y apellido) que han trabajado en cualquier
#película de la saga de La Guerra de las galaxias.
.*/

SELECT title, genre_id FROM series;

SELECT (SELECT title FROM episodes AS Ep 
WHERE AE.episode_id = Ep.id) AS EpisodeName,
       (SELECT first_name FROM actors AS a
       WHERE AE.actor_id = a.id  ) AS ActorName, 
         (SELECT last_name FROM actors AS a
       WHERE AE.actor_id = a.id  ) AS ActorLastName 
FROM actor_episode AS AE
ORDER BY episodeName;

select
  (select concat(first_name, ' ' ,last_name) from actors as a where am.actor_id = a.id ) as ActorName 
from actor_movie as am
WHERE (select title from movies as m where am.movie_id = m.id and title like 'la guerra de las galaxias%') is not null
group by ActorName;

-- Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por nombre de género

select 
 (select name from genres as g where g.id = m.genre_id) as Genero, 
 count(*) as Cantidad
from movies as m 
group by Genero
having Genero is not null;


