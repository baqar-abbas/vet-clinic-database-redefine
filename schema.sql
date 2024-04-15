/* Project Milestone 1 */

/* Create Database */

CREATE DATABASE vet_clinic_redefine

/* Create Table Animals */

CREATE TABLE animals (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(30) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempt INT NOT NULL,
    nuetered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);

/* Project Milestone 2 - query and update animals table */
/* Add a column species of type string to your animals table. */

ALTER TABLE animals ADD COLUMN species VARCHAR(50);

/* Project Milestone 3 - query multiple tables */
-- Create a table named owners with the following columns:

--     id: integer (set it as autoincremented PRIMARY KEY)
--     full_name: string
--     age: integer

CREATE TABLE owners (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    full_name VARCHAR(50) NOT NULL,
    age INT NOT NULL
);

-- Create a table named species with the following columns:

--     id: integer (set it as autoincremented PRIMARY KEY)
--     name: string

CREATE TABLE species (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL
);

-- Modify animals table:

--     Make sure that id is set as autoincremented PRIMARY KEY
--     Remove column species
--     Add column species_id which is a foreign key referencing species table
--     Add column owner_id which is a foreign key referencing the owners table

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);

/* Project Milestone 4 - Vet clinic database: add "join table" for visits*/

-- Create a table named vets with the following columns:

--     id: integer (set it as autoincremented PRIMARY KEY)
--     name: string
--     age: integer
--     date_of_graduation: date

CREATE TABLE vets (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL
);

-- There is a many-to-many relationship between the tables species and vets: 
-- a vet can specialize in multiple species, and a species can have multiple 
-- vets specialized in it. Create a "join table" called specializations to 
-- handle this relationship.

CREATE TABLE specializations (
    vet_id INT REFERENCES vets(id),
    species_id INT REFERENCES species(id),
    PRIMARY KEY (vet_id, species_id)
);

-- There is a many-to-many relationship between the tables animals and vets: 
-- an animal can visit multiple vets and one vet can be visited by multiple animals. 
-- Create a "join table" called visits to handle this relationship, it should also 
-- keep track of the date of the visit.

CREATE TABLE visits (
    vet_id INT REFERENCES vets(id),
    animal_id INT REFERENCES animals(id),
    date_of_visit DATE NOT NULL
);