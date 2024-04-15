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

/* Project Milestone 4 - Vet clinic database: add "join table" for visits*/

-- Insert the following data for vets:

--     Vet William Tatcher is 45 years old and graduated Apr 23rd, 2000.
--     Vet Maisy Smith is 26 years old and graduated Jan 17th, 2019.
--     Vet Stephanie Mendez is 64 years old and graduated May 4th, 1981.
--     Vet Jack Harkness is 38 years old and graduated Jun 8th, 2008.

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, DATE '2000-04-23'),
       ('Maisy Smith', 26, DATE '2019-01-17'),
       ('Stephanie Mendez', 64, DATE '1981-05-04'),
       ('Jack Harkness', 38, DATE '2008-06-08');

-- Insert the following data for specializations:

--     Vet William Tatcher is specialized in Pokemon.
--     Vet Stephanie Mendez is specialized in Digimon and Pokemon.
--     Vet Jack Harkness is specialized in Digimon.

INSERT INTO specializations (vet_id, species_id)
VALUES (1, 1),
       (3, 1),
       (3, 2),
       (4, 2);

-- Insert the following data for visits:

--     Agumon visited William Tatcher on May 24th, 2020.
--     Agumon visited Stephanie Mendez on Jul 22th, 2020.
--     Gabumon visited Jack Harkness on Feb 2nd, 2021.
--     Pikachu visited Maisy Smith on Jan 5th, 2020.
--     Pikachu visited Maisy Smith on Mar 8th, 2020.
--     Pikachu visited Maisy Smith on May 14th, 2020.
--     Devimon visited Stephanie Mendez on May 4th, 2021.
--     Charmander visited Jack Harkness on Feb 24th, 2021.
--     Plantmon visited Maisy Smith on Dec 21st, 2019.
--     Plantmon visited William Tatcher on Aug 10th, 2020.
--     Plantmon visited Maisy Smith on Apr 7th, 2021.
--     Squirtle visited Stephanie Mendez on Sep 29th, 2019.
--     Angemon visited Jack Harkness on Oct 3rd, 2020.
--     Angemon visited Jack Harkness on Nov 4th, 2020.
--     Boarmon visited Maisy Smith on Jan 24th, 2019.
--     Boarmon visited Maisy Smith on May 15th, 2019.
--     Boarmon visited Maisy Smith on Feb 27th, 2020.
--     Boarmon visited Maisy Smith on Aug 3rd, 2020.
--     Blossom visited Stephanie Mendez on May 24th, 2020.
--     Blossom visited William Tatcher on Jan 11th, 2021.

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES (1, 1, DATE '2020-05-24'),
       (1, 3, DATE '2020-07-22'),
       (2, 3, DATE '2021-02-02'),
       (3, 2, DATE '2020-01-05'),
       (3, 2, DATE '2020-03-08'),
       (3, 2, DATE '2020-05-14'),
       (4, 3, DATE '2021-05-04'),
       (5, 4, DATE '2021-02-24'),
       (6, 2, DATE '2019-12-21'),
       (6, 1, DATE '2020-08-10'),
       (6, 2, DATE '2021-04-07'),
       (7, 3, DATE '2019-09-29'),
       (8, 4, DATE '2020-10-03'),
       (8, 4, DATE '2020-11-04'),
       (9, 2, DATE '2019-01-24'),
       (9, 2, DATE '2019-05-15'),
       (9, 2, DATE '2020-02-27'),
       (9, 2, DATE '2020-08-03'),
       (10, 3, DATE '2020-05-24'),
       (10, 1, DATE '2021-01-11');
