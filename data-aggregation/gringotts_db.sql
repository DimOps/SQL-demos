SELECT COUNT(*) AS `count` FROM `wizzard_deposits`;

SELECT MAX(magic_wand_size) AS `longest_magic_wand` FROM `wizzard_deposits`;

SELECT deposit_group, MAX(magic_wand_size) AS `longest_magic_wand` FROM `wizzard_deposits`
GROUP BY deposit_group
HAVING longest_magic_wand > 30
ORDER BY longest_magic_wand;

SELECT deposit_group FROM `wizzard_deposits`
GROUP BY deposit_group
ORDER BY AVG(magic_wand_size);

SELECT deposit_group, SUM(deposit_amount) AS `total_sum` FROM `wizzard_deposits`
GROUP BY deposit_group
ORDER BY total_sum;

SELECT deposit_group, SUM(deposit_amount) AS `total_sum` FROM `wizzard_deposits`
WHERE magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
ORDER BY total_sum;

SELECT deposit_group, SUM(deposit_amount) AS `total_sum` FROM `wizzard_deposits`
WHERE magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
HAVING total_sum < 150000
ORDER BY total_sum DESC;

SELECT deposit_group, magic_wand_creator, MIN(deposit_charge) AS `Min deposit` FROM `wizzard_deposits`
GROUP BY deposit_group, magic_wand_creator
ORDER BY magic_wand_creator, deposit_group;

SELECT
    CASE
        WHEN 0 <= age AND age <= 10 THEN '[0-10]'
        WHEN 11 <= age AND age <= 20 THEN '[11-20]'
        WHEN 21 <= age AND age <= 30 THEN '[21-30]'
        WHEN 31 <= age AND age <= 40 THEN '[31-40]'
        WHEN 41 <= age AND age <= 50 THEN '[41-50]'
        WHEN 51 <= age AND age <= 60 THEN '[51-60]'
    ELSE '[61+]' END AS `age_group`, COUNT(*)
FROM `wizzard_deposits`
GROUP BY age_group
ORDER BY age_group;

SELECT SUBSTR(first_name, 1, 1) AS `first_letter` FROM `wizzard_deposits`
WHERE deposit_group = 'Troll Chest'
GROUP BY first_letter
ORDER BY first_letter;

SELECT deposit_group,
       IF(is_deposit_expired, 1, 0) AS `is_deposit_expired`,
       AVG(deposit_interest) AS `average_interest`
FROM `wizzard_deposits`
WHERE deposit_start_date > '1985-01-01'
GROUP BY deposit_group, is_deposit_expired
ORDER BY deposit_group DESC, is_deposit_expired;