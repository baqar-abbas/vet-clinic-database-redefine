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

