SELECT e.`employee_id`, CONCAT_WS(' ', e.`first_name`, e.`last_name`) AS `full_name`, d.`department_id`, d.`name`
FROM `employees` AS e
RIGHT JOIN `departments` AS d ON d.`manager_id` = e.`employee_id`
ORDER BY e.`employee_id` LIMIT 5;


SELECT t.`town_id`, t.`name`, a.`address_text` FROM `towns` as t
JOIN `addresses` AS a ON t.town_id = a.town_id
WHERE t.`name` = 'San Francisco' OR t.`name` = 'Carnation' OR t.`name` = 'Sofia'
ORDER BY t.`town_id`, a.`address_id`;


SELECT `employee_id`, `first_name`, `last_name`, `department_id`, `salary` FROM `employees`
WHERE manager_id IS NULL;


SELECT COUNT(*) AS `count` FROM `employees`
WHERE salary > (SELECT AVG(salary) FROM `employees`);

SELECT e.`employee_id`, e.`job_title`, a.`address_id`, a.`address_text` FROM `employees` AS e
JOIN `addresses` AS a ON a.address_id = e.address_id
ORDER BY a.`address_id`
LIMIT 5;


SELECT e.`first_name`, e.`last_name`, t.`name`, a.`address_text` FROM `employees` AS e
JOIN `addresses` AS a ON a.address_id = e.address_id
JOIN towns AS t ON a.town_id = t.town_id
ORDER BY e.`first_name`, e.`last_name`
LIMIT 5;


SELECT e.`employee_id`, e.`first_name`, e.`last_name`, d.`name` FROM `employees` AS e
JOIN `departments` AS d ON d.department_id = e.department_id
WHERE d.`name` = 'Sales'
ORDER BY e.`employee_id` DESC;


SELECT e.`employee_id`, e.`first_name`, e.`salary`, d.`name` FROM `employees` AS e
JOIN `departments` AS d ON d.department_id = e.department_id
WHERE e.salary > 15000
ORDER BY e.`department_id` DESC;


SELECT e.`employee_id`, e.`first_name` FROM `employees` AS e
WHERE e.`employee_id` NOT IN (SELECT e.`employee_id` FROM `employees` AS e
RIGHT JOIN employees_projects AS ep ON ep.employee_id = e.employee_id)
ORDER BY e.`employee_id` DESC
LIMIT 3;


SELECT e.`employee_id`, e.`first_name`, e.`last_name`, e.`hire_date`, d.`name` FROM `employees` AS e
JOIN `departments` AS d ON d.department_id = e.department_id
WHERE (d.`name` = 'Finance' OR d.`name` = 'Sales') AND e.hire_date > '1999-01-01'
ORDER BY e.`hire_date`;


SELECT e.`employee_id`, e.`first_name`, p.`name` FROM `employees` AS e
JOIN employees_projects ep on e.employee_id = ep.employee_id
JOIN projects p on ep.project_id = p.project_id
WHERE e.`employee_id` IN (SELECT e.`employee_id` FROM `employees` AS e
RIGHT JOIN employees_projects AS ep ON ep.employee_id = e.employee_id)
AND p.`start_date` > '2002-08-13'
ORDER BY e.`first_name`, p.`name`;


SELECT e.`employee_id`, e.`first_name`, IF(p.`start_date` >= '2005-01-01', NULL, p.`name`) AS `project_name`
FROM `employees` AS e
JOIN employees_projects ep on e.employee_id = ep.employee_id
JOIN projects p on ep.project_id = p.project_id
WHERE e.`employee_id` = 24
ORDER BY p.`name`;


SELECT e.`employee_id`, e.`first_name`,
    (SELECT `first_name` FROM `employees`
    WHERE employee_id = e.`manager_id`) AS `manager_name`
FROM `employees` AS e
WHERE e.`manager_id` IN (3, 7)
ORDER BY e.`first_name`;


SELECT e.`employee_id`, CONCAT_WS(' ', e.`first_name`, e.`last_name`) AS `employee_name`,
    (SELECT CONCAT_WS(' ',`first_name`, `last_name`) FROM `employees`
    WHERE employee_id = e.`manager_id`) AS `manager_name`,
    d.`name`
FROM `employees` AS e
JOIN `departments` AS d ON d.`department_id` = e.`department_id`
ORDER BY e.`employee_id`;


SELECT AVG(salary) AS 'min_average_salary' FROM `employees`
GROUP BY `department_id`
ORDER BY min_average_salary
LIMIT 1;