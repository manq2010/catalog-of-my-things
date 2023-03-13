CREATE TABLE
    item (
        id SERIAL PRIMARY KEY,
        genre VARCHAR(255) NOT NULL,
        author VARCHAR(255) NOT NULL,
        label VARCHAR(255) NOT NULL,
        publish_date DATE NOT NULL,
        archived BOOLEAN NOT NULL,
        label_id INT NOT NULL REFERENCES label (id),
        author_id INT NOT NULL REFERENCES author (id),
        book_id INT NOT NULL REFERENCES book (id),
        game_id INT NOT NULL REFERENCES game (id),
        genre_id INT NOT NULL REFERENCES genre (id),
        music_album_id INT NOT NULL REFERENCES music_album (id)
    );

CREATE INDEX label_id_index ON item (label_id);

CREATE INDEX book_id_index ON item (book_id);

CREATE INDEX author_id_index ON item (author_id);

CREATE INDEX game_id_index ON item (game_id);

CREATE INDEX genre_id_index ON item (genre_id);

CREATE INDEX music_album_id_index ON item (music_album_id);

CREATE TABLE
    label (
        id SERIAL PRIMARY KEY,
        title VARCHAR(255) NOT NULL,
        color VARCHAR(255) NOT NULL,
        items VARCHAR(255) CHECK (items IN ('')) NOT NULL
    );

CREATE TABLE
    book (
        id INTEGER NOT NULL,
        publisher VARCHAR(255) NOT NULL,
        cover_state VARCHAR(255) NOT NULL
    );

CREATE TABLE
    author (
        id SERIAL NOT NULL,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    game (
        id SERIAL NOT NULL,
        name VARCHAR(50) NOT NULL,
        multiplayer BOOLEAN NOT NULL,
        publish_date DATE NOT NULL,
        last_played_at DATE NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    music_album (
        id INTEGER NOT NULL,
        on_spotify VARCHAR(150) NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    genre (
        id SERIAL NOT NULL,
        name VARCHAR(50) NOT NULL,
        publish_date DATE NOT NULL,
        PRIMARY KEY (id)
    );
