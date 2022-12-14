SELECT country_name, iso_code FROM `countries`
WHERE country_name LIKE '%a%a%a%'
ORDER BY iso_code;

SELECT peak_name, river_name, LCASE(CONCAT(SUBSTR(peak_name, 1, LENGTH(peak_name)-1), river_name)) AS `mix` 
FROM peaks, rivers
WHERE LCASE(SUBSTR(peak_name, -1, 1)) = LCASE(SUBSTR(river_name, 1, 1))
ORDER BY mix;