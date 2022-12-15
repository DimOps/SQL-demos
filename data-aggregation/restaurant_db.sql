SELECT e.department_id, count(id) AS `Number of employees` FROM `employees` AS e
GROUP BY e.department_id
ORDER BY e.department_id;

SELECT e.department_id, ROUND(AVG(e.salary), 2) AS `Average salary` FROM `employees` AS e
GROUP BY e.department_id;

SELECT department_id, ROUND(MIN(salary), 2) AS `Min Salary` FROM `employees`
GROUP BY department_id
HAVING MIN(salary) > 800
ORDER BY department_id;

SELECT COUNT(*) AS `count` FROM `products`
WHERE price > 8 AND category_id = 2
GROUP BY category_id;

SELECT category_id, ROUND(AVG(price), 2) AS `Average Price`,
ROUND(MIN(price), 2) AS `Cheapest Product`,
ROUND(MAX(price), 2) AS `Most Expensive PRoduct` FROM products
GROUP BY category_id;