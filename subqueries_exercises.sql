USE employees;

SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (SELECT emp_no
                 FROM dept_manager)
LIMIT 10;

SELECT hire_date
from employees
where emp_no = '101010';


#exercise 1
Select *
From employees
WHERE hire_date in (SELECT hire_date
                    from employees
                    where emp_no = '101010');

#exercise 2
# SELECT title, COUNT(title)
# # from titles
# # where emp_no IN (SELECT emp_no
# #                  FROM employees
# #                  WHERE first_name = 'Aamod')
# # GROUP BY titles.emp_no;


SELECT DISTINCT title
FROM titles
WHERE emp_no IN (SELECT emp_no
                 FROM employees
                 WHERE first_name = 'Aamod');
# no DISTINCT means duplicates, adding DISTINCT shows the 6 unique titles.


# my version of the 3rd exercise
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (SELECT emp_no
                 From dept_manager
                 Where YEAR(to_date) = '9999'
                   AND gender = 'f');

#walkthrough
SELECT first_name, last_name
From employees
Where gender = "f"
  AND emp_no In (SELECT emp_no
                 From dept_manager
                 Where to_date = '9999-01-01');


SELECT dept_name
from departments
Where dept_no IN (select dept_no
                  From dept_manager
                  Where emp_no IN (select emp_no
                                   FROM employees
                                   Where YEAR(to_date) = '9999'
                                     AND gender = 'f'))
;

# Bonus #2
SELECT first_name, last_name
From employees
Where emp_no IN (Select emp_no
                 From salaries
                 Where salary = (SELECT MAX(salary)
                                 From salaries));
#these two queries do the same thing.
select first_name, last_name
From employees
where emp_no = (
    SELECT emp_no
    From salaries
    ORDER BY salary DESC
    limit 1
    );

