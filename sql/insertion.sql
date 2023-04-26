INSERT INTO trainers (
    name, age
) VALUES
    ('Brock', 27),
    ('Misty', 28);

INSERT INTO gyms (
    name, city, leader_id
) VALUES 
    (
        'Lavender gym',
        'Lavender',
        (SELECT id FROM trainers WHERE name LIKE 'Brock')
    ),
    (
        'De Misty Gym',
        'Albecete',
        (SELECT id FROM trainers WHERE name LIKE 'Misty')
    );

INSERT INTO pokemons (
    name, level, trainer_id
) VALUES
    (
        'Pikachu',
        16,
        (SELECT id FROM trainers WHERE name LIKE 'Misty')
    ),
    (
        'Starmie',
        32,
        (SELECT id FROM trainers WHERE name LIKE 'Misty')
    ),
    (
        'Onyx',
        20,
        (SELECT id FROM trainers WHERE name LIKE 'Brock')
    );

INSERT INTO elements (
    name
) VALUES
    ('Water'),
    ('Rock'),
    ('Lightning');

INSERT INTO pokemons_elements (
    pokemon_id, element_id
) VALUES
    (
        (SELECT id FROM pokemons WHERE name LIKE 'Pikachu'),
        (SELECT id FROM elements WHERE name LIKE 'Lightning')
    ),
    (
        (SELECT id FROM pokemons WHERE name LIKE 'Starmie'),
        (SELECT id FROM elements WHERE name LIKE 'Water')
    ),
    (
        (SELECT id FROM pokemons WHERE name LIKE 'Onyx'),
        (SELECT id FROM elements WHERE name LIKE 'Rock')
    );
