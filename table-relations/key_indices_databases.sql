CREATE DATABASE `test`;

USE `test`;

CREATE TABLE `passports` (
    `passport_id` INT PRIMARY KEY AUTO_INCREMENT,
    `passport_number` CHAR(8)
);

CREATE TABLE `people` (
    `person_id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(30),
    `salary` DECIMAL(10, 2),
    `passport_id` INT UNIQUE,
    CONSTRAINT `fk_people_passports` FOREIGN KEY (`passport_id`) REFERENCES `passports` (`passport_id`)
);