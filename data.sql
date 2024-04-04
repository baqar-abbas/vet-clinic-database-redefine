/* Populate database with ANIMALS data. */

INSERT INTO animals (name, date_of_birth, escape_attempt, nuetered, weight_kg)
VALUES ('Augmon', DATE '2020-02-03', 0, true, 10.23),
       ('Gabumon', DATE '2018-11-15', 2, true, 8),
       ('Pikachu', DATE '2021-01-07', 1, false, 15.04),
       ('Devimon', DATE '2017-05-12', 5, TRUE, 11);

/* Project Milestone 2 - query and update animals table*/

/* Animal: His name is Charmander. He was born on Feb 8th, 2020, and currently weighs -11kg. He is not neutered and he has never tried to escape. */
/* Animal: Her name is Plantmon. She was born on Nov 15th, 2021, and currently weighs -5.7kg. She is neutered and she has tried to escape 2 times. */
/* Animal: His name is Squirtle. He was born on Apr 2nd, 1993, and currently weighs -12.13kg. He was not neutered and he has tried to escape 3 times. */
/* Animal: His name is Angemon. He was born on Jun 12th, 2005, and currently weighs -45kg. He is neutered and he has tried to escape once. */
/* Animal: His name is Boarmon. He was born on Jun 7th, 2005, and currently weighs 20.4kg. He is neutered and he has tried to escape 7 times. */
/* Animal: Her name is Blossom. She was born on Oct 13th, 1998, and currently weighs 17kg. She is neutered and she has tried to escape 3 times. */
/* Animal: His name is Ditto. He was born on May 14th, 2022, and currently weighs 22kg. He is neutered and he has tried to escape 4 times. */

INSERT INTO animals (name, date_of_birth, escape_attempt, nuetered, weight_kg)
VALUES ('Charmander', DATE '2020-02-08', 0, false, -11),
         ('Plantmon', DATE '2021-11-15', 2, true, -5.7),
         ('Squirtle', DATE '1993-04-02', 3, false, -12.13),
         ('Angemon', DATE '2005-06-12', 1, true, -45),
         ('Boarmon', DATE '2005-06-07', 7, true, 20.4),
         ('Blossom', DATE '1998-10-13', 3, true, 17),
         ('Ditto', DATE '2022-05-14', 4, true, 22);

/* Project Milestone 3 - query multiple tables */

-- Insert the following data into the owners table:

--     Sam Smith 34 years old.
--     Jennifer Orwell 19 years old.
--     Bob 45 years old.
--     Melody Pond 77 years old.
--     Dean Winchester 14 years old.
--     Jodie Whittaker 38 years old.

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
       ('Jennifer Orwell', 19),
       ('Bob', 45),
       ('Melody Pond', 77),
       ('Dean Winchester', 14),
       ('Jodie Whittaker', 38);

-- Insert the following data into the species table:

--     Pokemon
--     Digimon

INSERT INTO SPECIES (name)
VALUES ('Pokemon'),
       ('Digimon');

-- Modify your inserted animals so it includes the species_id value:

--     If the name ends in "mon" it will be Digimon
--     All other animals are Pokemon

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

-- Modify your inserted animals to include owner information (owner_id):

--     Sam Smith owns Agumon.
--     Jennifer Orwell owns Gabumon and Pikachu.
--     Bob owns Devimon and Plantmon.
--     Melody Pond owns Charmander, Squirtle, and Blossom.
--     Dean Winchester owns Angemon and Boarmon.

UPDATE animals SET owner_id = 1 WHERE name = 'Augmon';

UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');
