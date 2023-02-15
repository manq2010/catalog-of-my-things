CREATE TABLE Book (
    id INTEGER NOT NULL,
    publisher VARCHAR(255) NOT NULL,
    cover_state VARCHAR(255) NOT NULL
);

CREATE INDEX publisher_idx ON Book (publisher);