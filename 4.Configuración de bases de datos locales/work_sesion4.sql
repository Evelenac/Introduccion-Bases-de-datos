CREATE DATABASE EvelynCorrales;

DROP DATABASE EvelynCorrales;

CREATE DATABASE EvelynCorrales;
USE EvelynCorrales;

CREATE TABLE users (
   id INT PRIMARY KEY, 
   genero VARCHAR(1), 
   edad INT,
   ocup INT,
   cp VARCHAR(20)
);

DESCRIBE users;
DROP TABLE users;
CREATE TABLE IF NOT EXISTS users (
   id INT PRIMARY KEY, 
   genero VARCHAR(1), 
   edad INT,
   ocup INT,
   cp VARCHAR(20)
);

CREATE TABLE movies (
   Movieid INT PRIMARY KEY, 
   Title VARCHAR(60), 
   Genres VARCHAR(60)
   );

   CREATE TABLE IF NOT EXISTS ratings (
   Userid INT, 
   Movieid INT,
   Rating INT, 
   Time_stamp BIGINT
   );
   
DROP TABLE movies;
DROP TABLE ratings;
SELECT * FROM users LIMIT 10;
SELECT count(Movieid) FROM movies;
SELECT count(Movieid) FROM ratings;



