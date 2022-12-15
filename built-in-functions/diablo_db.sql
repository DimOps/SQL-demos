SELECT name, DATE(start) AS `start` FROM `games`
WHERE YEAR(start) IN (2011, 2012)
ORDER BY start
LIMIT 50;

SELECT user_name, SUBSTR(email, LOCATE("@", email)+1) AS `Email Provider` FROM `users`
ORDER BY `Email Provider`, user_name;

SELECT user_name, ip_address FROM `users`
WHERE ip_address LIKE '___.1%.%.___'
ORDER BY user_name;

SELECT name, HOUR(start),
       CASE
           WHEN 0 <= HOUR(start) AND HOUR(start) < 12 THEN 'Morning'
           WHEN 12 <= HOUR(start) AND HOUR(start)< 18 THEN 'Afternoon'
           WHEN 18 <= HOUR(start) AND HOUR(start) < 24 THEN 'Evening'
           END AS 'Part of the Day',
       CASE
          WHEN duration <= 3 THEN 'Extra Short'
          WHEN 3 < duration AND games.duration <= 6 THEN 'Short'
          WHEN 6 < duration AND games.duration <= 10 THEN 'Long'
        ELSE 'Extra Long' END AS `Duration`
FROM `games`;