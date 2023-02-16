CREATE TABLE Item (
    id SERIAL PRIMARY KEY,
    genre VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    label VARCHAR(255) NOT NULL,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    label_id INT NOT NULL REFERENCES label (id),
    book_id INT NOT NULL REFERENCES book (id)
);

CREATE INDEX label_id_index ON Item (label_id);
CREATE INDEX book_id_index ON Item (book_id);

CREATE TABLE Label(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    color VARCHAR(255) NOT NULL,
    items VARCHAR(255) CHECK (items IN('')) NOT NULL
);

CREATE INDEX title_idx ON Label (title);

CREATE TABLE Book (
    id INTEGER NOT NULL,
    publisher VARCHAR(255) NOT NULL,
    cover_state VARCHAR(255) NOT NULL
);

CREATE INDEX publisher_idx ON Book (publisher);