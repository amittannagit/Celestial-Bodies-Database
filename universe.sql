-- Create the universe database
CREATE DATABASE universe;

-- Connect to the universe database
\c universe

-- Create the galaxy table
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    age_in_millions_of_years INT,
    diameter_in_light_years INT,
    is_spiral BOOLEAN NOT NULL,
    has_black_hole BOOLEAN,
    description TEXT
);

-- Create the star table
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    mass NUMERIC(10, 2),
    temperature_kelvin INT,
    is_binary BOOLEAN NOT NULL,
    color VARCHAR(20),
    age_in_millions_of_years INT
);

-- Create the planet table
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id),
    mass NUMERIC(10, 2),
    radius_km INT,
    has_atmosphere BOOLEAN NOT NULL,
    is_habitable BOOLEAN,
    orbital_period_days INT,
    surface_temperature_celsius INT
);

-- Create the moon table
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id),
    radius_km INT,
    is_spherical BOOLEAN NOT NULL,
    has_water BOOLEAN,
    orbital_period_days NUMERIC(10, 2),
    surface_gravity NUMERIC(5, 2)
);

-- Create an additional table (e.g., asteroid)
CREATE TABLE asteroid (
    asteroid_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    diameter_km NUMERIC(10, 2),
    is_potentially_hazardous BOOLEAN NOT NULL,
    orbit_class VARCHAR(50),
    discovery_year INT
);

-- Insert sample data into the galaxy table
INSERT INTO galaxy (name, age_in_millions_of_years, diameter_in_light_years, is_spiral, has_black_hole, description)
VALUES
    ('Milky Way', 13600, 100000, true, true, 'Our home galaxy'),
    ('Andromeda', 10000, 220000, true, true, 'Nearest spiral galaxy to the Milky Way'),
    ('Triangulum', 5000, 60000, true, false, 'Third-largest galaxy in the Local Group'),
    ('Centaurus A', 13270, 60000, false, true, 'Peculiar galaxy with active galactic nucleus'),
    ('Sombrero', 13250, 50000, true, true, 'Spiral galaxy with a prominent dust lane'),
    ('Whirlpool', 400, 60000, true, false, 'Interacting grand-design spiral galaxy');

-- Insert sample data into the star table
INSERT INTO star (name, galaxy_id, mass, temperature_kelvin, is_binary, color, age_in_millions_of_years)
VALUES
    ('Sun', 1, 1.00, 5778, false, 'Yellow', 4600),
    ('Sirius', 1, 2.02, 9940, true, 'White', 242),
    ('Betelgeuse', 1, 11.60, 3500, false, 'Red', 8),
    ('Alpha Centauri A', 1, 1.10, 5790, true, 'Yellow', 5300),
    ('Proxima Centauri', 1, 0.12, 3042, false, 'Red', 4850),
    ('Antares', 1, 11.70, 3400, false, 'Red', 11);

-- Insert sample data into the planet table
INSERT INTO planet (name, star_id, mass, radius_km, has_atmosphere, is_habitable, orbital_period_days, surface_temperature_celsius)
VALUES
    ('Earth', 1, 1.00, 6371, true, true, 365, 15),
    ('Mars', 1, 0.11, 3389, true, false, 687, -63),
    ('Jupiter', 1, 317.80, 69911, true, false, 4333, -145),
    ('Venus', 1, 0.82, 6052, true, false, 225, 462),
    ('Saturn', 1, 95.20, 58232, true, false, 10759, -178),
    ('Neptune', 1, 17.10, 24622, true, false, 60190, -214),
    ('Mercury', 1, 0.06, 2439, false, false, 88, 167),
    ('Uranus', 1, 14.50, 25362, true, false, 30687, -224),
    ('Kepler-186f', 2, 1.11, 8749, true, true, 130, -85),
    ('HD 209458 b', 3, 0.69, 94410, true, false, 3, 1000),
    ('Gliese 581g', 4, 3.10, 14980, true, true, 37, -37),
    ('TRAPPIST-1e', 5, 0.77, 5990, true, true, 6, 10);

-- Insert sample data into the moon table
INSERT INTO moon (name, planet_id, radius_km, is_spherical, has_water, orbital_period_days, surface_gravity)
VALUES
    ('Moon', 1, 1737, true, true, 27.32, 1.62),
    ('Phobos', 2, 11, false, false, 0.32, 0.0057),
    ('Deimos', 2, 6, false, false, 1.26, 0.003),
    ('Io', 3, 1821, true, false, 1.77, 1.796),
    ('Europa', 3, 1560, true, true, 3.55, 1.314),
    ('Ganymede', 3, 2634, true, true, 7.15, 1.428),
    ('Callisto', 3, 2410, true, true, 16.69, 1.235),
    ('Titan', 5, 2576, true, true, 15.95, 1.352),
    ('Enceladus', 5, 252, true, true, 1.37, 0.113),
    ('Mimas', 5, 198, true, false, 0.94, 0.064),
    ('Triton', 6, 1353, true, true, 5.88, 0.779),
    ('Nereid', 6, 170, false, false, 360.14, 0.071),
    ('Charon', 8, 606, true, false, 6.39, 0.288),
    ('Oberon', 8, 761, true, false, 13.46, 0.346),
    ('Titania', 8, 788, true, false, 8.71, 0.367),
    ('Miranda', 8, 235, true, false, 1.41, 0.079),
    ('Ariel', 8, 578, true, false, 2.52, 0.269),
    ('Umbriel', 8, 584, true, false, 4.14, 0.234),
    ('Dione', 5, 561, true, false, 2.74, 0.232),
    ('Tethys', 5, 531, true, false, 1.89, 0.146);

-- Insert sample data into the asteroid table
INSERT INTO asteroid (name, diameter_km, is_potentially_hazardous, orbit_class, discovery_year)
VALUES
    ('Ceres', 939.4, false, 'Main Belt', 1801),
    ('Vesta', 525.4, false, 'Main Belt', 1807),
    ('Pallas', 511.0, false, 'Main Belt', 1802),
    ('Bennu', 0.49, true, 'Apollo', 1999),
    ('Apophis', 0.37, true, 'Aten', 2004);
    