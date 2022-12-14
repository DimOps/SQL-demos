-- book_library --

SELECT title FROM `books`
WHERE SUBSTR(title, 1, 3) = 'The';

SELECT REPLACE(title, 'The', '***') AS 'Title' FROM `books`
WHERE SUBSTR(title, 1, 3) = 'The';

SELECT ROUND(SUM(cost), 2) AS 'Cost' FROM `books`;

SELECT CONCAT_WS(' ', first_name, last_name) AS 'Full Name', TIMESTAMPDIFF(DAY, born, died) AS 'Days Lived'
FROM `authors`;

SELECT title FROM `books`
WHERE  title LIKE '%Harry Potter%'
ORDER BY id;