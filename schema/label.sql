CREATE TABLE Label(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    color VARCHAR(255) NOT NULL,
    items VARCHAR(255) CHECK (items IN('')) NOT NULL
);

CREATE INDEX title_idx ON Label (title);