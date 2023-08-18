USE codeup_test_db;

Drop TABLE IF EXISTS albums;

CREATE TABLE albums (
    id INT UNSIGNED NOT NULL  AUTO_INCREMENT,
    artist VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    release_date INT NOT NULL,
    sales DECIMAL(7, 2) NOT NULL,
    genre VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

