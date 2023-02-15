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

