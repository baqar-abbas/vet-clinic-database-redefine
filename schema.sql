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