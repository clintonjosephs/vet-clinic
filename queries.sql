/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';

SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name from animals WHERE neutered = TRUE AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';     

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;       

SELECT * FROM animals WHERE neutered = TRUE;                                                                                               ;

SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/* Start transaction query for species column */

BEGIN;
  UPDATE animals SET species = 'unspecified';

  select * from animals;

ROLLBACK TRANSACTION;

/* end transaction query for species column */

/* Start transaction query for updating species column for animals that have name ending in mon and those that do not have species already set */

BEGIN;

    UPDATE animals SET species = 'digimon' WHERE name LIKE 'mon%';

    UPDATE animals SET species = 'pokemon' WHERE species = '';

    /* Confirm updates */

    SELECT * FROM animals;

COMMIT WORK;

/* END transaction */

/* Start transaction to delete all records in the animals table */

BEGIN;
    DELETE FROM animals;
ROLLBACK;

/* End transaction with rollback */

/* Start transaction for multiple operations */

BEGIN;

    DELETE FROM animals WHERE date_of_birth > '2022-01-01';

    SAVEPOINT deleteAnimalsDob;

    UPDATE animals SET weight_kg = weight_kg * -1;

    ROLLBACK TO deleteAnimalsDob;

    UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

    RELEASE SAVEPOINT deleteAnimalsDob;

COMMIT;
/* End transaction */

/* WRITE QUERIES TO ANSWER QUESTIONS */

SELECT COUNT(id) as animals_count FROM animals;

SELECT COUNT(id) as never_tried_escape FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) as average_weight FROM animals;

SELECT SUM(escape_attempts) as escape_count, neutered FROM animals GROUP BY neutered ORDER BY escape_count DESC LIMIT 1;

SELECT species, MAX(weight_kg) as maximum_weight, MIN(weight_kg) as minimum_weight FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

/* END */

/* What animals belong to melody pond ? */



/* End */