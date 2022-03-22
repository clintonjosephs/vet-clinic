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
    SELECT animals.name as animals_name, 
        owners.full_name as owners_name 
    FROM animals 
    JOIN 
        owners 
    ON 
        animals.owner_id = owners.id 
    WHERE 
        owners.full_name 
    LIKE 
        '%Melody Pond%';
/* End */

/* List of all animals that are pokemon ? */
    SELECT animals.name as Animal_Name, 
        species.name as Specie 
    FROM animals 
    JOIN 
        species 
    ON 
        animals.species_id = species.id 
    WHERE 
        species.id = 1;
/* End */

/* List all owners and there animals */
    SELECT 
        owners.full_name as Owner, 
        animals.name as AnimalsName 
    FROM animals 
    RIGHT JOIN 
        owners 
    ON animals.owner_id = owners.id;
/* End */

/* How many animals are there per species? */
    SELECT 
        Count(animals.id) as AnimalCount, 
        species.name from animals 
    JOIN species 
    ON 
        animals.species_id = species.id 
    GROUP BY species.id;
/* END */

/* List all digimon owned by Jennifer Orwell */
 SELECT animals.name as AnimalName, 
        owners.full_name as Owner, 
        species.name as Specie 
 FROM animals 
 JOIN 
    owners ON animals.owner_id = owners.id AND owners.full_name LIKE '%Jennifer Orwell%' 
 JOIN 
    species ON animals.species_id = species.id AND species.name LIKE '%Digimon%';
/* END */

/* List all animals owned by Dean Winchester that havent tried to escape */
  SELECT animals.name as AnimalName, 
        owners.full_name as Owner 
  FROM animals 
  LEFT JOIN 
    owners ON animals.owner_id = owners.id 
  WHERE animals.owner_id = 5 
  AND animals.escape_attempts = 0;
/* END */

/* Who owns the most animals? */
  SELECT owners.id as OwnerId, 
         owners.full_name, 
        Count(animals.owner_id) as numOwned 
  FROM animals 
  JOIN owners 
  ON 
    animals.owner_id = owners.id 
  GROUP BY owners.id 
  Order BY numOwned DESC 
  LIMIT 1;
/* END */