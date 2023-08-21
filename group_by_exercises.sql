USE employees;

SHOW DATABASES;

SELECT *
From titles;

SELECT last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name;

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY first_name, last_name;


#  you need to fix this one
SELECT COUNT(*),
       last_name
FROM employees
WHERE last_name LIKE '%q%'
  And last_name NOT LIKE '%qu%'
GROUP BY last_name;

SELECT count(gender), gender
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;






