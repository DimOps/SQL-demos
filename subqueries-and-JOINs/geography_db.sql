SELECT m.`mountain_range`, p.`peak_name`, p.`elevation` FROM `peaks` AS p
JOIN `mountains` AS m ON m.`id` = p.`mountain_id`
WHERE m.`mountain_range` = 'Rila'
ORDER BY p.`elevation` DESC;


SELECT c.`country_code`, m.`mountain_range`, p.`peak_name`, p.`elevation` FROM `countries` AS c
JOIN `mountains_countries` AS mc ON c.`country_code` = mc.`country_code`
JOIN `mountains` AS m ON m.`id` = mc.`mountain_id`
JOIN `peaks` AS p ON m.`id` = p.`mountain_id`
WHERE c.`country_code` = 'BG' AND p.`elevation` > 2835
ORDER BY p.`elevation` DESC;


SELECT c.`country_code`, COUNT(mc.`mountain_id`) AS `mountain_range` FROM `countries` AS c
JOIN mountains_countries AS mc ON c.`country_code` = mc.`country_code`
WHERE  c.`country_name` = 'Russia' OR c.`country_name` = 'United States' OR c.`country_name` = 'Bulgaria'
GROUP BY c.`country_code`;


SELECT c.`country_name`, r.`river_name` FROM `countries` AS c
LEFT JOIN `countries_rivers` AS cr ON c.`country_code` = cr.`country_code`
LEFT JOIN `rivers` AS r ON r.`id` = cr.`river_id`
JOIN `continents` ON continents.`continent_code` = c.`continent_code`
WHERE continents.`continent_name` = 'Africa'
ORDER BY c.`country_name`;


SELECT `continent_code`, `currency_code`, COUNT(`country_code`) AS `currency_usage` FROM `countries` AS c
GROUP BY `continent_code`, `currency_code`
HAVING currency_usage = (
    SELECT COUNT(country_code) AS `count`
    FROM `countries` AS c1
    WHERE c1.`continent_code` = c.`continent_code`
    GROUP BY c1.`currency_code`
    ORDER BY count DESC
    LIMIT 1
    ) AND currency_usage > 1
ORDER BY continent_code, currency_code;


SELECT COUNT(country_code) AS `count` FROM `countries`
WHERE `country_code` NOT IN (
SELECT c.`country_code` FROM `countries` AS c
JOIN `mountains_countries` AS mc ON c.`country_code` = mc.`country_code`
JOIN `mountains` AS m ON m.id = mc.`mountain_id`);

SELECT c.`country_name`,
       MAX(p.`elevation`) AS `highest_peak`,
       MAX(r.`length`) AS `longest_river`
FROM `countries` AS c
JOIN `countries_rivers` AS cr
ON c.`country_code` = cr.`country_code`
JOIN `rivers` AS r
ON r.`id` = cr.`river_id`
JOIN `mountains_countries` AS mc
ON c.`country_code` = mc.`country_code`
JOIN `mountains` AS m
ON m.`id` = mc.`mountain_id`
JOIN `peaks` AS p
ON m.`id` = p.`mountain_id`
GROUP BY c.`country_code`
ORDER BY highest_peak DESC, longest_river DESC;