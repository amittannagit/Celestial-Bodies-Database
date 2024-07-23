# Celestial Bodies Database

A PostgreSQL database modeling celestial bodies including galaxies, stars, planets, moons, and asteroids. Created for the freeCodeCamp Relational Database certification.

## Database Structure
- Tables: galaxy, star, planet, moon, asteroid
- Primary keys and foreign key relationships implemented
- Sample data included

## Setup
1. Create a database named 'universe'
2. Run the SQL commands in `universe.sql`

## Usage
Query examples:
- View all galaxies: `SELECT * FROM galaxy;`
- View stars in Milky Way: `SELECT * FROM star WHERE galaxy_id = 1;`
- View habitable planets: `SELECT * FROM planet WHERE is_habitable = true;`

Created by Amit Tanna
