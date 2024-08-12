# Celestial Bodies Database

> Welcome! Are you ready to build a database of the universe?

## Overview

In this project, you will create a database to manage data about galaxies, stars, planets, and moons. You'll need to set up the database, create tables, and ensure that all relationships and constraints are correctly implemented. This project will help you practice SQL and database design.

## Instructions

Follow the instructions below to complete the project. Make sure to pass all tests to finish the project successfully. Have fun and get creative with your database design!

**Important**: Remember to connect to your database after creating it. Use the `psql` command to log in and `\c universe` to connect to your database.

## 1.1 Tasks

### 1. Create the Database

1. **Create a Database**:
   - Log into PostgreSQL:
     ```bash
     psql --username=freecodecamp --dbname=postgres
     ```
   - Create the `universe` database:
     ```sql
     CREATE DATABASE universe;
     ```
   - Connect to the `universe` database:
     ```sql
     \c universe
     ```

### 2. Create Tables

1. **Create Tables**:
   - You need to create tables for `galaxy`, `star`, `planet`, and `moon`.
   - Each table should have a primary key that auto-increments.
   - Each table should include a `name` column and other columns of different data types.

   **Example Schema**:

   ```sql
   CREATE TABLE galaxy (
       galaxy_id SERIAL PRIMARY KEY,
       name VARCHAR(255) UNIQUE NOT NULL,
       description TEXT,
       distance_from_earth NUMERIC,
       has_life BOOLEAN
   );

   CREATE TABLE star (
       star_id SERIAL PRIMARY KEY,
       name VARCHAR(255) UNIQUE NOT NULL,
       galaxy_id INT REFERENCES galaxy(galaxy_id),
       type VARCHAR(50),
       age_in_millions_of_years INT,
       is_spherical BOOLEAN
   );

   CREATE TABLE planet (
       planet_id SERIAL PRIMARY KEY,
       name VARCHAR(255) UNIQUE NOT NULL,
       star_id INT REFERENCES star(star_id),
       diameter NUMERIC,
       has_rings BOOLEAN,
       atmosphere TEXT
   );

   CREATE TABLE moon (
       moon_id SERIAL PRIMARY KEY,
       name VARCHAR(255) UNIQUE NOT NULL,
       planet_id INT REFERENCES planet(planet_id),
       diameter NUMERIC,
       is_spherical BOOLEAN
   );
   ```

### 3. Insert Data

1. **Populate the Tables**:
   - Insert at least six rows into the `galaxy` and `star` tables.
   - Insert at least twelve rows into the `planet` table.
   - Insert at least twenty rows into the `moon` table.
   - Ensure each table has at least three columns and meets the requirements for columns that should not accept `NULL` values.

   **Example Insertion**:

   ```sql
   INSERT INTO galaxy (name, description, distance_from_earth, has_life)
   VALUES ('Milky Way', 'Our galaxy', 0, TRUE),
          ('Andromeda', 'Closest galaxy', 2500000, FALSE),
          -- Add more rows
          ;

   INSERT INTO star (name, galaxy_id, type, age_in_millions_of_years, is_spherical)
   VALUES ('Sun', 1, 'G-Type', 4600, TRUE),
          ('Proxima Centauri', 1, 'M-Type', 4600, TRUE),
          -- Add more rows
          ;
   ```

### 4. Ensure Constraints

1. **Check Constraints**:
   - Ensure that:
     - Each table has a primary key that auto-increments.
     - Columns that should not accept `NULL` values have the `NOT NULL` constraint.
     - Each table has at least one `UNIQUE` column.
     - Foreign key relationships are correctly implemented.

## Additional Notes

- **Database Dump**: To save your progress, create a dump of your database:
  ```bash
  pg_dump -cC --inserts -U freecodecamp universe > universe.sql
  ```

- **Restoring Database**: To restore the database from the dump file:
  ```bash
  psql -U postgres < universe.sql
  ```

- **Permissions**: Ensure your SQL scripts and any other necessary files have the correct permissions.

## Submission

- Save your progress on freeCodeCamp.org.
- Upload the `universe.sql` file and any final scripts to a public repository.
- Submit the URL to the repository on freeCodeCamp.org.

