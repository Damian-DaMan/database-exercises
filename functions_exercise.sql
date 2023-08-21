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
ORDER BY first_name, last_name;

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;



SELECT *
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no DESC;


# Find all employees with a 'q' in their last name — 1,873 rows.
Select *
from employees
where last_name like '%q';

# ===================== part two

SELECT *
FROM employees
WHERE first_name = 'Irena'
   OR first_name = 'Vidya'
   OR first_name = 'Maya';

SELECT *
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya')
  AND gender = 'M';

SELECT *
FROM employees
WHERE last_name LIKE 'E%'
   OR last_name LIKE '%E';

SELECT *
FROM employees
WHERE last_name LIKE 'E%'
  AND last_name LIKE '%E';


# ==================================== new functions exercise part

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name LIKE 'E%'
  AND last_name LIKE '%E';

Select *
From employees
Where month(birth_date) = 12
  AND day(birth_date) = 25;

Select *
From employees
Where year(hire_date) BETWEEN 1990 AND 1999
  And month (birth_date) = 12
  AND day (birth_date) = 25;

SELECT *
FROM employees
WHERE YEAR(hire_date) BETWEEN 1990 AND 1999
  AND MONTH(birth_date) = 12
  AND DAY(birth_date) = 25
ORDER BY hire_date DESC, birth_date ASC
LIMIT 1;

SELECT *,
       DATEDIFF(NOW(), hire_date) AS days_worked
FROM employees
WHERE YEAR(hire_date) BETWEEN 1990 AND 1999
  AND MONTH(birth_date) = 12
  AND DAYOFMONTH(birth_date) = 25;
# ORDER BY hire_date DESC, birth_date ASC;