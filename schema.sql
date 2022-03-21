/* Database schema to keep the structure of entire database. */

CREATE TABLE animals 
     ( id INTEGER GENERATED ALWAYS AS IDENTITY, 
      name VARCHAR(250), 
      date_of_birth DATE, 
      escape_attempts INTEGER, 
      neutered BIT, 
      weight_kg DECIMAL );