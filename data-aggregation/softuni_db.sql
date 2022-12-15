SELECT department_id, MIN(salary) FROM `employees`
WHERE hire_date > '2000-01-01' AND department_id IN (2, 5, 7)
GROUP BY department_id
ORDER BY department_id;

CREATE TABLE `high_salaries` AS
    SELECT * FROM `employees`
    WHERE salary > 30000;

DELETE FROM high_salaries
       WHERE manager_id = 42;

UPDATE high_salaries
SET salary = salary + 5000
WHERE department_id = 1;

SELECT department_id, AVG(salary) AS `avg_salary` FROM high_salaries
GROUP BY department_id
ORDER BY department_id;

SELECT department_id, MAX(salary) FROM `employees`
WHERE salary NOT BETWEEN 30000 AND 70000
GROUP BY department_id
ORDER BY department_id;

SELECT COUNT(*) FROM `employees`
WHERE manager_id IS NULL;

SELECT department_id,
       (SELECT DISTINCT emp.salary FROM `employees` AS `emp`
        WHERE emp.department_id = e.department_id
        ORDER BY emp.salary DESC
        LIMIT 1 OFFSET 2) AS `third_highest_salary`
FROM `employees` AS `e`
GROUP BY e.department_id
HAVING third_highest_salary IS NOT NULL
ORDER BY e.department_id;


SELECT e.first_name, e.last_name, e.department_id FROM `employees` AS `e`
WHERE e.salary > (SELECT AVG(emp.salary) FROM employees AS `emp`
                WHERE emp.department_id = e.department_id)
ORDER BY e.department_id, e.employee_id;

SELECT department_id, SUM(salary) AS `total_salary` FROM `employees`
GROUP BY department_id
ORDER BY department_id;