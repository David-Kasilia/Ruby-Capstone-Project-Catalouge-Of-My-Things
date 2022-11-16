CREATE TABLE item (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    genre text NOT NULL,
    author text NOT NULL,
    source text NOT NULL,
    label text NOT NULL,
    publish_date date NOT NULL,
    archived boolean NOT NULL,
    PRIMARY KEY(id)
); 

CREATE TABLE music_album (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    archived boolean NOT NULL,
    name text NOT NULL,
    publish_date date NOT NULL,
    FOREIGN KEY(id) references item(id)
);

CREATE TABLE genre (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    name text NOT NULL
);
