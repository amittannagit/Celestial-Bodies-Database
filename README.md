```markdown
# Celestial Bodies Database

## Project Description

This project is a PostgreSQL database that models celestial bodies in our universe. It was created as part of the freeCodeCamp Relational Database certification.

## Database Structure

The database consists of five tables:

1. `galaxy`
2. `star`
3. `planet`
4. `moon`
5. `asteroid` (additional table)

Each table has a primary key that automatically increments, and appropriate foreign key relationships are established between tables.

## Table Details

### Galaxy Table
- Contains information about different galaxies
- Includes columns for name, age, diameter, type, and other characteristics

### Star Table
- Stores data about stars
- Linked to the galaxy table
- Includes information such as mass, temperature, and color

### Planet Table
- Contains details about planets
- Linked to the star table
- Includes data on mass, radius, atmosphere, and habitability

### Moon Table
- Stores information about moons
- Linked to the planet table
- Includes details like radius, shape, and orbital period

### Asteroid Table
- Additional table with information about asteroids
- Includes data such as diameter, potential hazard classification, and discovery year

## Key Features

- Uses various data types including INT, NUMERIC, TEXT, BOOLEAN, and VARCHAR
- Implements NOT NULL and UNIQUE constraints
- Follows naming conventions for primary and foreign keys
- Contains sample data for each table

## How to Use

1. Ensure you have PostgreSQL installed on your system
2. Connect to PostgreSQL using the command:
   ```
   psql --username=freecodecamp --dbname=postgres
   ```
3. Create the `universe` database and connect to it
4. Run the SQL commands provided in the script to create tables and insert data

## Backup and Restore

To create a backup of the database:
```
pg_dump -cC --inserts -U freecodecamp universe > universe.sql
```

To restore the database:
```
psql -U postgres < universe.sql
```

## Project Requirements

This database was created to meet specific requirements, including:
- Specific table and column structures
- Minimum number of rows for each table
- Use of various data types and constraints
- Proper relationships between tables

For a full list of requirements, please refer to the project instructions.

## Author

Amit Tanna

## Acknowledgments

This project was completed as part of the freeCodeCamp Relational Database certification.

