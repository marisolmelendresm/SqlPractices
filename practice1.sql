SELECT school, first_name FROM teachers ORDER BY 1,2;

SELECT first_name, last_name FROM teachers WHERE salary > 40000 AND first_name LIKE 'S%';

SELECT first_name, last_name, salary, hire_date FROM teachers WHERE hire_date > '2010-01-01' ORDER BY salary DESC;