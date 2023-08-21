Use employees;

Show tables;

# SELECT first_name, last_name
# FROM employees
# ORDER BY last_name;
#
# SELECT first_name, last_name
# FROM employees
# ORDER BY last_name DESC;
#
# SELECT first_name, last_name
# FROM employees
# ORDER BY last_name ASC;

# ================= ORDER BY exercises

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

SELECT * FROM employees WHERE last_name LIKE 'E%';

# Find all employees with a 'q' in their last name — 1,873 rows.
Select * from employees where last_name like '%q';

# ===================== part two

SELECT *
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';

SELECT * FROM employees WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M';

SELECT * FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%E';

SELECT * FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E';

SELECT * FROM employees