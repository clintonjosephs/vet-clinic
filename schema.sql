/* Database schema to keep the structure of entire database. */

CREATE TABLE animals 
            ( id INTEGER GENERATED ALWAYS AS IDENTITY, 
              name VARCHAR(250), 
              date_of_birth DATE, 
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

ALTER TABLE animals ADD CONSTRAINT pk_animals PRIMARY KEY(id);

ALTER TABLE animals ADD COLUMN species_id INTEGER;

ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id) ON DELETE CASCADE;

ALTER TABLE animals ADD COLUMN owner_id INTEGER;

ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id) ON DELETE CASCADE;

CREATE TABLE vets ( 
        id INTEGER GENERATED ALWAYS AS IDENTITY, 
        name TEXT, 
        age INTEGER, 
        date_of_graduation DATE, 
    PRIMARY KEY(id) 
);

CREATE TABLE specialization ( 
            id SERIAL PRIMARY KEY, 
            vet_id INTEGER, 
            species_id INTEGER, 
        CONSTRAINT fk_vets FOREIGN KEY (vet_id) REFERENCES vets(id) ON DELETE CASCADE, 
        CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE
    );

CREATE TABLE visits (
            id SERIAL PRIMARY KEY, 
            animals_id INTEGER, 
            vets_id INTEGER, 
            date_of_visit DATE, 
        CONSTRAINT fk_animals FOREIGN KEY (animals_id) REFERENCES animals(id) ON DELETE CASCADE, 
        CONSTRAINT fk_vets FOREIGN KEY (vets_id) REFERENCES vets(id) ON DELETE CASCADE
    );
