/* Creates a database called db_movies */
CREATE DATABASE db_movies
GO

/* Speciefies the database used */
USE db_movies

/* Creates all the necesary tables */
CREATE TABLE tb1_movies (
	movies_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	movies_name VARCHAR(100) NOT NULL,
	movies_director_id INT NOT NULL,
	movies_actor_id INT NOT NULL
);

CREATE TABLE tb1_directors (
	directors_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	directors_name VARCHAR(50) NOT NULL,
	directors_movies_id INT NOT NULL
);

CREATE TABLE tb1_actors (
	actors_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	actors_name VARCHAR(50) NOT NULL,
	actors_movies_id INT NOT NULL
);

/* Fills in the recently created tables with data */
INSERT INTO tb1_movies
	(movies_name, movies_director_id, movies_actor_id)
	VALUES
	('Gone With The Wind', 1, 1),
	('Interstellar', 2, 2),
	('The Godfather', 3, 3),
	('Alien', 4, 4),
	('Parasite', 5, 6)
;
SELECT * FROM tb1_movies;

INSERT INTO tb1_directors
	(directors_name, directors_movies_id)
	VALUES
	('Victor Fleming', 1),
	('Christopher Nolan', 2),
	('Francis Ford Coppola', 3),
	('Ridley Scott', 4),
	('Bong Joon Ho', 5)
;
SELECT * FROM tb1_directors;

INSERT INTO tb1_actors
	(actors_name, actors_movies_id)
	VALUES
	('Clark Gabel', 1),
	('Matthew McConaughey', 2),
	('Marlon Brando', 3),
	('Sigourney Weaver', 4),
	('Kang-ho Song', 5)
;
SELECT * FROM tb1_actors;

/* Statements that queries data from all table */
SELECT movies_name FROM tb1_movies WHERE movies_director_id = 1
SELECT directors_name FROM tb1_directors WHERE directors_id = 1;
SELECT actors_name FROM tb1_actors WHERE actors_id = 1;

