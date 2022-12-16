CREATE TABLE `mountains` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE `peaks` (
        `id` INT PRIMARY KEY AUTO_INCREMENT,
        `name` VARCHAR(50) NOT NULL,
        `mountain_id` INT NOT NULL,
        CONSTRAINT fk_peaks_mountains FOREIGN KEY (`mountain_id`) REFERENCES `mountains` (`id`)
        ON DELETE CASCADE
);


SELECT v.driver_id, v.vehicle_type, CONCAT_WS(' ', c.first_name, c.last_name) AS `driver_name` FROM campers AS c
JOIN `vehicles` AS v
    ON c.id = v.driver_id;


SELECT r.starting_point, r.end_point, r.leader_id, CONCAT_WS(' ', c.first_name, c.last_name) FROM `routes` AS r
JOIN `campers` AS c ON c.id = r.leader_id;