DROP TABLE IF EXISTS pokemons_elements;
DROP TABLE IF EXISTS pokemons;
DROP TABLE IF EXISTS gyms;
DROP TABLE IF EXISTS elements;
DROP TABLE IF EXISTS trainers;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS trainers (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL UNIQUE,
    age SMALLINT NOT NULL
);

CREATE TABLE IF NOT EXISTS gyms (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL UNIQUE,
    city TEXT NOT NULL,
    leader_id uuid REFERENCES trainers
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS pokemons (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL UNIQUE,
    level SMALLINT NOT NULL DEFAULT 1,
    trainer_id uuid REFERENCES trainers
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS elements (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS pokemons_elements (
    pokemon_id uuid REFERENCES pokemons
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    element_id uuid REFERENCES elements
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT pokemon_element_id PRIMARY KEY (pokemon_id, element_id)
);