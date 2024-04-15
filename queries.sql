/* Queries that provide answers to the questions.*/

/* Find all animals whose name ends in "mon". */
SELECT * FROM animnals WHERE name LIKE '%mon';

/* List the name of all animals born between 2016 and 2019. */
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

/* List the name of all animals that are neutered and have less than 3 escape attempts. */
SELECT name FROM animals WHERE nuetered =true AND escape_attempt < 3;

/* List the date of birth of all animals named either "Agumon" or "Pikachu". */
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

/* List name and escape attempts of animals that weigh more than 10.5kg */
SELECT name, escape_attempt FROM animals WHERE weight_kg > 10.5;

/* Find all animals that are neutered. */
SELECT * FROM animals WHERE nuetered = true;

/* Find all animals not named Gabumon. */
SELECT * FROM animals WHERE name != 'Gabumon';

/* Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg) */
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* Project Milestone 2 - query and update animals table */

/* Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that the species columns went back to the state before the transaction. */
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

/* Inside a transaction: */
BEGIN;
/* Update the animals table by setting the species column to digimon for all animals that have a name ending in mon. */
/* Update the animals table by setting the species column to pokemon for all animals that don't have species already set. */
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
/* Verify that changes were made. */
SELECT * FROM animals;
/* Commit the transaction.*/
COMMIT;
/* Verify that changes persist after commit. */
SELECT * from animals;

/* Now, take a deep breath and... Inside a transaction delete all records in the animals table, then roll back the transaction. */
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
/* Verify that the records are back. */
SELECT * FROM animals;

/* Inside a transaction:  */
BEGIN;
/* Delete all animals born after Jan 1st, 2022. */
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
/* Create a savepoint for the transaction.  */
SAVEPOINT delete_animals_datewise;
/* Update all animals' weight to be their weight multiplied by -1. */
UPDATE animals SET weight_kg = weight_kg * -1;
/* Rollback to the savepoint */
ROLLBACK TO delete_animals_datewise;
/* Verify that the records are back. */
SELECT * FROM animals;
/* Update all animals' weights that are negative to be their weight multiplied by -1. */
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
/* Commit the transaction. */
COMMIT;

/* Write queries to answer the following questions:  */

/* How many animals are there? */
SELECT COUNT(*) FROM animals;

/* How many animals have never tried to escape? */
SELECT COUNT(escape_attempt) FROM animals WHERE escape_attempt = 0;

/* What is the average weight of animals? */
SELECT AVG(weight_kg) AS Average_weight FROM animals;

/* Who escapes the most, neutered or not neutered animals? */
SELECT nuetered, MAX(escape_attempt) FROM animals GROUP BY nuetered;

/* What is the minimum and maximum weight of each type of animal? */
SELECT species, MIN(weight_kg) AS Min_weight, MAX(weight_kg) AS Max_weight FROM animals GROUP BY species;

/* What is the average number of escape attempts per animal type of those born between 1990 and 2000? */
SELECT species, AVG(escape_attempt) AS Average_escape_attempts FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

/* Project Milestone 3 - query multiple tables */

-- Write queries (using JOIN) to answer the following questions: 

-- What animals belong to Melody Pond?

SELECT animals.name, owners.full_name FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon)

SELECT animals.name, species.name FROM animals
INNER JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.

SELECT owners.full_name, animals.name FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id
ORDER BY owners.full_name;

-- How many animals are there per species?

SELECT species.name, COUNT(animals.id) AS number_of_animals FROM animals
INNER JOIN species ON animals.species_id = species.id
GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell

SELECT animals.name, species.name, owners.full_name FROM animals
INNER JOIN species ON animals.species_id = species.id
INNER JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.

SELECT animals.name , owners.full_name, animals.escape_attempt FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempt = 0;

-- Who owns the most animals?

SELECT owners.full_name, COUNT(animals.id) AS number_of_animals FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name ORDER BY number_of_animals DESC;

/* Project Milestone 4 - Vet clinic database: add "join table" for visits*/

-- Write queries to answer the following:
-- Who was the last animal seen by William Tatcher?

  SELECT a.name,v.date_of_visit, ve.name FROM animals a
  JOIN visits v ON a.id = v.animal_id
  JOIN vets ve ON v.vet_id = ve.id WHERE ve.name ='William Tatcher' ORDER BY(v.date_of_visit) DESC
  LIMIT 1;

--   How many different animals did Stephanie Mendez see?

SELECT ve.name, COUNT(a.name) as animal_visits_count FROM animals a
  JOIN visits v ON a.id = v.animal_id
  JOIN vets ve ON v.vet_id = ve.id WHERE ve.name ='Stephanie Mendez' GROUP BY(ve.name);

-- List all vets and their specialties, including vets with no specialties.

SELECT ve.name, s.name FROM vets ve
  LEFT JOIN specializations sp ON ve.id = sp.vet_id
  LEFT JOIN species s ON sp.species_id = s.id;

--   List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.

SELECT a.name, v.date_of_visit, ve.name FROM animals a
  JOIN visits v ON a.id = v.animal_id
  JOIN vets ve ON v.vet_id = ve.id WHERE ve.name ='Stephanie Mendez' AND v.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?

SELECT a.name, COUNT(v.animal_id) as animal_visits_count FROM animals a
  JOIN visits v ON a.id = v.animal_id GROUP BY(a.name) ORDER BY animal_visits_count DESC LIMIT 1;

-- Who was Maisy Smith's first visit?

SELECT a.name, v.date_of_visit, ve.name FROM animals a
  JOIN visits v ON a.id = v.animal_id
  JOIN vets ve ON v.vet_id = ve.id WHERE ve.name ='Maisy Smith' ORDER BY(v.date_of_visit) ASC
  LIMIT 1;

--   Details for most recent visit: animal information, vet information, and date of visit.

SELECT a.name, v.date_of_visit, ve.name FROM animals a
  JOIN visits v ON a.id = v.animal_id
  JOIN vets ve ON v.vet_id = ve.id ORDER BY(v.date_of_visit) DESC
  LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?

  SELECT a.name, ve.name, COUNT(*) FROM visits v
  JOIN vets ve ON v.vet_id = ve.id
  JOIN animals a ON v.animal_id = a.id
  LEFT JOIN specializations s ON ve.id = s.vet_id AND a.species_id = s.species_id
  WHERE s.species_id IS NULL GROUP BY(a.name, ve.name);

--   What specialty should Maisy Smith consider getting? Look for the species she gets the most.

  SELECT s.name, COUNT(*) as sum_of_visits FROM vets ve
  JOIN visits v ON ve.id = v.vet_id
  JOIN animals a ON a.id = v.animal_id
  JOIN species s ON a.species_id = s.id WHERE ve.name ='Maisy Smith' GROUP BY(s.id)
  ORDER BY(sum_of_visits) DESC
  LIMIT 1;