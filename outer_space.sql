-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  galaxy TEXT NOT NULL,
  orbits_around_id INTEGER REFERENCES orbits_around,
  moons_id INTEGER REFERENCES moons
);

CREATE TABLE orbits_around
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT[] NOT NULL
);

INSERT INTO planets
(name, orbital_period_in_years, galaxy)
VALUES
  ('Earth', 1.00,  'Milky Way'),
  ('Mars', 1.88,  'Milky Way'),
  ('Venus', 0.62,  'Milky Way' ),
  ('Neptune', 164.8,  'Milky Way'),
  ('Proxima Centauri b', 0.03,  'Milky Way'),
  ('Gliese 876 b', 0.23,  'Milky Way' );

INSERT INTO orbits_around
(name)
VALUES
  ('The Sun'),
  ('The Sun'),
  ('The Sun'),
  ('The Sun'),
  ('Proxima Centauri'),
 ('Gliese 876');

 INSERT INTO moons
 (name)
 VALUES
 ('{"The Moon"}'),
 ('{"Phobos", "Deimos"}'),
 ('{}'),
 ('{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
 ('{}'),
 ('{}');