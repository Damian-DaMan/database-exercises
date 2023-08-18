USE codeup_test_db;

DESCRIBE codeup_test_db.albums;

-- Exercise 1: Select albums released after 1991

-- SELECT statement
SELECT name AS "Albums Released After 1991"
FROM albums
WHERE release_date > 1991;

-- Exercise 2: Select albums with the genre 'disco'
-- SELECT statement
SELECT name AS "Albums with Genre 'Disco'"
FROM albums
WHERE genre = 'Disco';

-- Exercise 3: Select albums by 'Whitney Houston'
-- SELECT statement
SELECT name AS "Albums by Whitney Houston"
FROM albums
WHERE artist = 'Whitney Houston';

-- Convert the SELECT statements to DELETE

-- Exercise 1: Delete albums released after 1991
-- DELETE statement
DELETE FROM albums
WHERE release_date > 1991;

-- Exercise 2: Delete albums with the genre 'disco'
-- DELETE statement
DELETE FROM albums
WHERE genre = 'Disco';

-- Exercise 3: Delete albums by 'Whitney Houston'
-- DELETE statement
DELETE FROM albums
WHERE artist = 'Whitney Houston';
