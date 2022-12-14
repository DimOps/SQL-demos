SELECT id, first_name, last_name, job_title FROM employees
ORDER BY id;

SELECT id, CONCAT_WS(' ', first_name, last_name) AS 'full_name', job_title, salary FROM employees
WHERE salary > 1000
ORDER BY id;