/* Database schema to keep the structure of entire database. */

CREATE TABLE animals 
            ( id INTEGER GENERATED ALWAYS AS IDENTITY, 
              name VARCHAR(250), date_of_birth DATE, 
              escape_attempts INTEGER, 
              neutered BOOLEAN, 
              weight_kg DECIMAL
            );

ALTER TABLE animals ADD COLUMN species TEXT;

CREATE TABLE owners
     (
         id INTEGER GENERATED ALWAYS AS IDENTITY,
         full_name TEXT,
         age INTEGER,
         PRIMARY KEY(id),
     );

CREATE TABLE species
     (
         id INTEGER GENERATED ALWAYS AS IDENTITY,
         name TEXT,
         PRIMARY KEY(id),
     );

ALTER TABLE animals DROP column species;

ALTER TABLE animals ADD COLUMN species_id INTEGER;

ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id) ON DELETE CASCADE;

ALTER TABLE animals ADD COLUMN owner_id INTEGER;

ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id) ON DELETE CASCADE;