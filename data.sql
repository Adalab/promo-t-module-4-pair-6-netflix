CREATE TABLE movies (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  title VARCHAR(45) NOT NULL,
  genre VARCHAR(45) NOT NULL,
  image VARCHAR(1000) NOT NULL,
  category VARCHAR(45) NOT NULL,
  year INT DEFAULT NULL
 ); 

CREATE TABLE users (
idUsers INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
user VARCHAR(45) NOT NULL,
password VARCHAR(45) NOT NULL,
name VARCHAR(45) NOT NULL,
email VARCHAR(45) NOT NULL,
plan_details VARCHAR(45) NOT NULL
);

CREATE TABLE actors (
 idActor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  lastname VARCHAR(45) NOT NULL,
  country VARCHAR(45) NOT NULL,
  year_birthday INT NULL
); 

-- Peliculas

SELECT * FROM movies;

SELECT title, genre FROM movies WHERE year > 1990;

SELECT * FROM movies WHERE category = "Top 10";

UPDATE movies SET year = 1997 WHERE (id = 2);

-- Actores 

SELECT * from actors;

SELECT year_birthday, name FROM actors WHERE year_birthday BETWEEN 1950 and 1960;

SELECT name, lastname FROM actors WHERE country = "Estados Unidos";

-- Usuarios
SELECT * FROM users;

SELECT plan_details FROM users WHERE plan_details = "Standard";

DELETE FROM users WHERE name LIKE "M%" LIMIT 1;

-- Agregar mas campos
SELECT * from actors;

ALTER TABLE actors ADD image VARCHAR(1000);
