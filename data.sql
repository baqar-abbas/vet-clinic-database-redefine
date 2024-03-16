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
