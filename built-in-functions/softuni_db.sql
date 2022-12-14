SELECT first_name, last_name FROM `employees`
WHERE LCASE(first_name) LIKE 'sa%'
ORDER BY employee_id;

SELECT first_name, last_name FROM `employees`
WHERE LCASE(last_name) LIKE '%ei%'
ORDER BY employee_id;

SELECT first_name FROM `employees`
WHERE department_id IN (3, 10) AND YEAR(hire_date) BETWEEN 1995 AND 2005
ORDER BY employee_id;

SELECT first_name, last_name FROM `employees`
WHERE LCASE(job_title) NOT LIKE '%engineer%'
ORDER BY employee_id;

SELECT name FROM towns
WHERE LENGTH(name) IN (5, 6)
ORDER BY name;

SELECT town_id, name FROM towns
WHERE LCASE(SUBSTR(name, 1, 1)) IN ('m', 'k', 'b', 'e')
ORDER BY name;

SELECT town_id, name FROM towns
WHERE LCASE(SUBSTR(name, 1, 1)) NOT IN ('r', 'd', 'b')
ORDER BY name;

CREATE VIEW `v_employees_hired_after_2000` AS
    SELECT first_name, last_name FROM `employees`
    WHERE YEAR(hire_date) > 2000
    ORDER BY employee_id;

SELECT * FROM `v_employees_hired_after_2000`;

SELECT first_name, last_name FROM `employees`
WHERE LENGTH(last_name) = 5
ORDER BY employee_id;