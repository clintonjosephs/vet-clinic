/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';

SELECT name from animals WHERE 
      EXTRACT(YEAR FROM date_of_birth) >= 2016 
      AND EXTRACT(YEAR FROM date_of_birth) <= 2019;

SELECT name from animals WHERE neutered = TRUE AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';     

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;       

SELECT * FROM animals WHERE neutered = TRUE;                                                                                               ;

SELECT * FROM animals WHERE name != 'Gabumon';