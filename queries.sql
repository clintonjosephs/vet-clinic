/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';

SELECT name from animals WHERE 
      EXTRACT(YEAR FROM date_of_birth) >= 2016 
      AND EXTRACT(YEAR FROM date_of_birth) <= 2019;
      
SELECT name from animals WHERE neutered = TRUE AND escape_attempts < 3;