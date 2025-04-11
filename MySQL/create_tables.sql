-- Create the schema if it doesn’t exist
CREATE SCHEMA IF NOT EXISTS `eecs447`;

-- Select the schema as the active database
USE `eecs447`;

-- 1) Create the User table
CREATE TABLE `User` (
    `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `reg_no` VARCHAR(50) NOT NULL,
    `name` VARCHAR(100),
    `first_name` VARCHAR(50),
    `last_name` VARCHAR(50),
    `dob` DATE,
    `email` VARCHAR(100),
    `phone` VARCHAR(15),
    `reg_date` DATE,
    `membership_type` VARCHAR(50),
    PRIMARY KEY (`user_id`)
) ENGINE = InnoDB;

-- 2) Create the Staff table
CREATE TABLE `Staff` (
    `staff_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(50),
    `last_name` VARCHAR(50),
    `email` VARCHAR(100),
    PRIMARY KEY (`staff_id`)
) ENGINE = InnoDB;

-- 3) Create the Authentication table
CREATE TABLE `Authentication` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- 4) Create the Login table
CREATE TABLE `Login` (
    `id` INT UNSIGNED NOT NULL,
    `user_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`, `user_id`),
    FOREIGN KEY (`id`) REFERENCES `Authentication` (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE = InnoDB;

-- 5) Create the Keeps_track_of table
CREATE TABLE `Keeps_track_of` (
    `staff_id` INT UNSIGNED NOT NULL,
    `user_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`staff_id`, `user_id`),
    FOREIGN KEY (`staff_id`) REFERENCES `Staff` (`staff_id`),
    FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE = InnoDB;

-- 6) Create the Media table
CREATE TABLE `Media` (
    `media_id` VARCHAR(50) NOT NULL,
    `title` VARCHAR(100),
    `media_type` VARCHAR(20),
    PRIMARY KEY (`media_id`)
) ENGINE = InnoDB;

-- 7) Create the Book table
CREATE TABLE `Books` (
    `media_id` VARCHAR(50) NOT NULL,
    `title` VARCHAR(100),
    `author` VARCHAR(100),
    `pub_date` DATE,
    `genre` VARCHAR(50),
    `availability` BOOLEAN,
    PRIMARY KEY (`media_id`),
    FOREIGN KEY (`media_id`) REFERENCES `Media` (`media_id`)
) ENGINE = InnoDB;

-- 8) Create the Magazine table
CREATE TABLE `Magazines` (
    `media_id` VARCHAR(50) NOT NULL,
    `title` VARCHAR(100),
    `issn` VARCHAR(20),
    `iss_num` INT UNSIGNED,
    `publisher` VARCHAR(100),
    `genre` VARCHAR(50),
    PRIMARY KEY (`media_id`),
    FOREIGN KEY (`media_id`) REFERENCES `Media` (`media_id`)
) ENGINE = InnoDB;

-- 9) Create the Movie table
CREATE TABLE `Movies` (
    `media_id` VARCHAR(50) NOT NULL,
    `title` VARCHAR(100),
    `director` VARCHAR(100),
    `duration` INT UNSIGNED,
    `genre` VARCHAR(50),
    PRIMARY KEY (`media_id`),
    FOREIGN KEY (`media_id`) REFERENCES `Media` (`media_id`)
) ENGINE = InnoDB;

-- 10) Create the Game table
CREATE TABLE `Games` (
    `media_id` VARCHAR(50) NOT NULL,
    `title` VARCHAR(100),
    `developer` VARCHAR(100),
    `console` VARCHAR(50),
    `genre` VARCHAR(50),
    `age_rating` VARCHAR(10),
    PRIMARY KEY (`media_id`),
    FOREIGN KEY (`media_id`) REFERENCES `Media` (`media_id`)
) ENGINE = InnoDB;

-- 11) Create the Reserves_returns table
CREATE TABLE `Reserves_returns` (
    `user_id` INT UNSIGNED NOT NULL,
    `media_id` VARCHAR(50) NOT NULL,
    `date_reserved` DATE NOT NULL,
    `return_date` DATE,
    `due_date` DATE,
    PRIMARY KEY (`user_id`, `media_id`, `date_reserved`),
    FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
    FOREIGN KEY (`media_id`) REFERENCES `Media` (`media_id`)
) ENGINE = InnoDB;

-- 12) Create the Reports table
CREATE TABLE `Reports` (
    `report_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `staff_id` INT UNSIGNED NOT NULL,
    `report_date` DATE,
    PRIMARY KEY (`report_id`),
    FOREIGN KEY (`staff_id`) REFERENCES `Staff` (`staff_id`)
) ENGINE = InnoDB;

-- 13) Create the Queues table
CREATE TABLE `Queues` (
    `queue_num` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `media_id` VARCHAR(50) NOT NULL,
    `user_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`queue_num`),
    FOREIGN KEY (`media_id`) REFERENCES `Media` (`media_id`),
    FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE = InnoDB;