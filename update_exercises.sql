USE codeup_test_db;

-- SELECT statement
SELECT name AS "All Albums Before Update"
FROM albums;

-- UPDATE statement
UPDATE albums
SET sales = sales * 10;

-- SELECT statement to see the updated results
SELECT name AS "All Albums After Update"
FROM albums;
# -------------------------------------------------------------

-- SELECT statement
SELECT name AS "Albums Before Update"
FROM albums
WHERE release_date < 1980;

-- UPDATE statement
UPDATE albums
SET release_date = release_date - 100
WHERE release_date < 1980;

-- SELECT statement to see the updated results
SELECT name AS "Albums After Update"
FROM albums
WHERE release_date < 1980;

# -----------------------------------------------

-- SELECT statement
SELECT name AS "Albums by Michael Jackson Before Update"
FROM albums
WHERE artist = 'Michael Jackson';

-- UPDATE statement
UPDATE albums
SET artist = 'Peter Jackson'
WHERE artist = 'Michael Jackson';

-- SELECT statement to see the updated results
SELECT name AS "Albums by Peter Jackson After Update"
FROM albums
WHERE artist = 'Peter Jackson';



