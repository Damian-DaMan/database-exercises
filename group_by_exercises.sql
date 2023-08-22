USE employees;

SHOW DATABASES;

SELECT DISTINCT title
From titles;

SELECT last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name
Order BY last_name;



SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY first_name, last_name
ORDER BY last_name;



SELECT last_name
FROM employees
WHERE last_name LIKE '%q%'
  And last_name NOT LIKE '%qu%'
GROUP BY last_name; #group by is needed for the 3 names only to appear as the exercise.

SELECT COUNT(*) AS total, last_name AS "last Name"           #added count
FROM employees
WHERE last_name LIKE '%q%'
  And last_name NOT LIKE '%qu%'
GROUP BY last_name;

SELECT count(gender), gender
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;






