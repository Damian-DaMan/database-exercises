Create database if not exists ad_lister;

show databases;

USE ad_lister;

DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users
(
    id                INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username          VARCHAR(50)  NOT NULL,
    email             VARCHAR(50)  NOT NULL,
    password          VARCHAR(50)  NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);


Describe users;

CREATE TABLE if not exists ads
(
    id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title       varchar(100) NOT NULL,
    description TEXT         NOT NULL,
    users_id    INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (users_id) REFERENCES users (id)
);


CREATE TABLE IF NOT EXISTS categories
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,ads
    cat_des varchar(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS ads_cat
(
    category_id INT UNSIGNED NOT NULL,
    ads_id      INT UNSIGNED NOT NULL,
    FOREIGN KEY (category_id) references categories (id),
    FOREIGN KEY (ads_id) references ads (id)
);

# ================== END OF TABLES =============

# +++++++++++++++++= Inserting data ===================/
INSERT INTO users (username, email, password)
VALUES ('john_doe', 'john@example.com', 'securepassword'),
       ('jane_smith', 'jane@example.com', 'strongpassword'),
       ('alice_wonderland', 'alice@example.com', 'safepassword'),
       ('bob_marley', 'bob@example.com', 'password123'),
       ('emily_parker', 'emily@example.com', 'mypassword');

-- Inserting sample ads
INSERT INTO ads (title, description, users_id)
VALUES ('Laptop for Sale', 'Gently used laptop for sale.', 1),
       ('Web Developer Needed', 'Looking for an experienced web developer.', 2),
       ('Free Couch', 'Giving away a comfortable couch for free.', 3),
       ('Car Repair Services', 'Expert car repair services at affordable prices.', 4),
       ('Language Tutoring', 'Offering language tutoring for beginners.', 5),
       ('Paint my roof', 'Looking for a contractor to paint my roof.', 2);


# Inserting sample categories
INSERT INTO categories (cat_des)
VALUES ('For Sale'),
       ('Help Wanted'),
       ('Giveaway/Free'),
       ('Services'),
       ('Tutoring');

-- Associating ads with categories
-- For the purpose of this example, let's associate each ad with one category
INSERT INTO ads_cat (category_id, ads_id)
VALUES (1, 1), -- Laptop for Sale belongs to For Sale
       (2, 2), -- Web Developer Needed belongs to Help Wanted
       (3, 3), -- Free Couch belongs to Giveaway/Free
       (4, 4), -- Car Repair Services belongs to Services
       (5, 5);
-- Language Tutoring belongs to Tutoring


#     ============================
# question 1
SELECT email
FROM users
WHERE id = (SELECT users_id
            FROM ads
            WHERE id = 3);

# question 2
SELECT cat_des
FROM categories
WHERE id IN (SELECT category_id
             FROM ads_cat
             WHERE ads_id = 1);

#question 3
# question 3
SELECT title, description
FROM ads
WHERE id IN (SELECT ads_id
             FROM ads_cat
             WHERE category_id = 2);


#question 4
# For a given user, show all the ads they have posted.
# SELECT title, description
# FROM ads
# WHERE users_id = (SELECT id
#                   FROM users
#                   WHERE username = 'username_here');

# Question
SELECT ads.title, ads.description
FROM ads
         JOIN users ON ads.users_id = users.id
WHERE users.username = 'john_doe';