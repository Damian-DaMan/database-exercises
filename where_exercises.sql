USE employees;

Show tables;

SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no BETWEEN 10026 AND 10082;

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name IN ('Herber', 'Dredge', 'Lipner', 'Baek');

SELECT emp_no, title
FROM titles
WHERE to_date IS NOT NULL;

SELECT emp_no, title
FROM titles
WHERE to_date IS NULL;

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name IN ('Herber','Baek')
  AND emp_no < 20000;

SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no < 20000
    AND last_name IN ('Herber','Baek')
   OR first_name = 'Shridhar';

SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no < 20000
  AND (
            last_name IN ('Herber','Baek')
        OR first_name = 'Shridhar'
    );



# ================================ exercise 1
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

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

SELECT * FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';

