# CREATE DATABASE join_test_db;
#
# USE join_test_db;
#
# CREATE TABLE roles
# (
#     id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
#     name VARCHAR(100) NOT NULL,
#     PRIMARY KEY (id)
# );
#
# CREATE TABLE users
# (
#     id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
#     name    VARCHAR(100) NOT NULL,
#     email   VARCHAR(100) NOT NULL,
#     role_id INT UNSIGNED DEFAULT NULL,
#     PRIMARY KEY (id),
#     FOREIGN KEY (role_id) REFERENCES roles (id)
# );
#
# INSERT INTO roles (name)
# VALUES ('admin');
# INSERT INTO roles (name)
# VALUES ('author');
# INSERT INTO roles (name)
# VALUES ('reviewer');
# INSERT INTO roles (name)
# VALUES ('commenter');
#
# INSERT INTO users (name, email, role_id)
# VALUES ('bob', 'bob@example.com', 1),
#        ('joe', 'joe@example.com', 2),
#        ('sally', 'sally@example.com', 3),
#        ('adam', 'adam@example.com', 3),
#        ('jane', 'jane@example.com', null),
#        ('mike', 'mike@example.com', null);
#
# INSERT INTO users (name, email, role_id)
# VALUES ('alice', 'alice@example.com', 2), -- Author
#        ('mark', 'mark@example.com', 2),   -- Author
#        ('lisa', 'lisa@example.com', 2),   -- Author
#        ('chris', 'chris@example.com', null);
# -- No role
#
# # ========================= joins
#
# SELECT users.name, users.email, roles.name AS role #INNER JOIN?
# FROM users
#          JOIN roles ON users.role_id = roles.id;
#
#
# SELECT users.name, users.email, roles.name AS role #left
# FROM users
#          LEFT JOIN roles ON users.role_id = roles.id;
#
# SELECT users.name, users.email, roles.name AS role #right
# FROM users
#          RIGHT JOIN roles ON users.role_id = roles.id;


# SELECT roles.name AS Role, count(users.id) AS 'Total Users'
# From roles
#     LEFT Join users
#         ON roles.id = users.role_id
# group by roles.name;


USE employees;

SHOW tables;

SELECT d.dept_name AS 'Department Name',
       CONCAT(e.first_name, ' ', e.last_name)
                   AS 'Department Manager' #blueprint, define how the table will look
FROM departments as d
         JOIN dept_manager as dm
              ON d.dept_no = dm.dept_no
         JOIN employees as e
              ON dm.emp_no = e.emp_no
#  this is going to get the data where it JOINS
WHERE dm.to_date = '9999-01-01'
  AND e.gender like 'f'
# this is us NOW filtering the data for what we want
ORDER BY d.dept_name;
# this is putting the order of the data to the original blueprint


# SELECT t.dept_name AS 'title', COUNT(*)
#                    AS 'Total'  #blueprint, define how the table will look
# FROM titles as t
#          JOIN titles t.emp_no as em
#               ON t.emp_no = e.emp_no
#          JOIN employees as e
#               ON e.emp_no = t.emp_no
# #  this is going to get the data where it JOINS
# WHERE dm.to_date = '9999-01-01' AND e.gender like 'f'
# # this is us NOW filtering the data for what we want
# GROUP BY title;
# # this is putting the order of the data to the original blueprint

SELECT t.title AS Title, Count(t.emp_no) AS Total
FROM titles t # this is the same thing as saying, FROM titles AS t
         Join dept_emp de
              ON t.emp_no = de.emp_no
         Join departments d on de.dept_no = d.dept_no
Where d.dept_name = 'Customer Service'
  AND t.to_date = '9999-01-01'
  AND de.to_date = '9999-01-01'
GROUP BY t.title;



SELECT d.dept_name AS 'Department Name',
       CONCAT(e.first_name, ' ', e.last_name)
                   AS 'Department Manager',
       s.salary    AS Salary
FROM departments as d
         JOIN dept_manager as dm
              ON d.dept_no = dm.dept_no
         JOIN employees as e
              ON dm.emp_no = e.emp_no
         Join salaries s
              ON e.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01'
  AND
Where s.to_date = '9999-01-01'
ORDER BY d.dept_name;


# Bonus
SELECT concat(e.first_name, ' ', e.last_name)               AS Employee,
       d.dept_name                                          AS Department,
       concat(managers.first_name, ' ', managers.last_name) AS Manager
FROM employees e
         JOin dept_emp de
              On e.emp_no = de.emp_no
         Join departments d
              ON de.dept_no = d.dept_no
         Join dept_manager dm
              On d.dept_no = dm.dept_no
         Join employees managers
              On dm.emp_no = managers.emp_no
WHERE de.to_date = '9999-01-01'
AND dm.to_date = '9999-01-01'
ORDER BY d.dept_name, managers.first_name, e.emp_no;
