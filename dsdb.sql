-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema dsdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `dsdb` ;

-- -----------------------------------------------------
-- Schema dsdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dsdb` DEFAULT CHARACTER SET utf8 ;
USE `dsdb` ;

-- -----------------------------------------------------
-- Table `contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contact` ;

CREATE TABLE IF NOT EXISTS `contact` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(100) NULL,
  `state` VARCHAR(45) NULL,
  `zipcode` VARCHAR(10) NULL,
  `email` VARCHAR(60) NULL,
  `phone` VARCHAR(15) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(50) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `sitter` TINYINT(1) NOT NULL,
  `contact_id` INT NOT NULL,
  `balance` DECIMAL(6,2) NOT NULL DEFAULT 0.0,
  PRIMARY KEY (`id`),
  INDEX `fk_user_contact1_idx` (`contact_id` ASC),
  CONSTRAINT `fk_user_contact1`
    FOREIGN KEY (`contact_id`)
    REFERENCES `contact` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dog` ;

CREATE TABLE IF NOT EXISTS `dog` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `weight` INT NULL,
  `img_url` VARCHAR(300) NOT NULL DEFAULT 'https://images-na.ssl-images-amazon.com/images/G/01/img15/pet-products/small-tiles/23695_pets_vertical_store_dogs_small_tile_8._CB312176604_.jpg',
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_dog_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_dog_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sitter` ;

CREATE TABLE IF NOT EXISTS `sitter` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `size_pref` ENUM('TOY', 'SMALL', 'MEDIUM', 'LARGE', 'GIANT') NULL,
  `user_id` INT NOT NULL,
  `average_rating` DECIMAL(3,1) NOT NULL DEFAULT 0.0,
  `rate` DECIMAL(6,2) NULL DEFAULT 0.0,
  `availability` ENUM('ANYTIME', 'WEEKENDS', 'EVENINGS', 'OVERNIGHTS', 'WEEKDAYS') NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_sitter_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_sitter_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `appointment` ;

CREATE TABLE IF NOT EXISTS `appointment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NULL,
  `dog_id` INT NOT NULL,
  `sitter_id` INT NOT NULL,
  `rating` DECIMAL(3,1) NULL DEFAULT 0.0,
  PRIMARY KEY (`id`, `dog_id`),
  INDEX `fk_appointment_dog1_idx` (`dog_id` ASC),
  INDEX `fk_appointment_sitter1_idx` (`sitter_id` ASC),
  CONSTRAINT `fk_appointment_dog1`
    FOREIGN KEY (`dog_id`)
    REFERENCES `dog` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointment_sitter1`
    FOREIGN KEY (`sitter_id`)
    REFERENCES `sitter` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO admin@localhost;
 DROP USER admin@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';

GRANT ALL ON * TO 'admin'@'localhost';
SET SQL_MODE = '';
GRANT USAGE ON *.* TO user@localhost;
 DROP USER user@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'user'@'localhost' IDENTIFIED BY 'user';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'user'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `contact`
-- -----------------------------------------------------
START TRANSACTION;
USE `dsdb`;
INSERT INTO `contact` (`id`, `street`, `state`, `zipcode`, `email`, `phone`, `first_name`, `last_name`, `city`) VALUES (1, '123123 street', 'co', '23924', 'erwer@asdklj.com', '123-1233-2323', 'Eric', 'Lee', 'Aurora');
INSERT INTO `contact` (`id`, `street`, `state`, `zipcode`, `email`, `phone`, `first_name`, `last_name`, `city`) VALUES (2, '12314 street', 'as', '13142', 'test@agsdkg.com', '123-444-4555', 'Michael', 'Roschenwimmer', 'Denver');
INSERT INTO `contact` (`id`, `street`, `state`, `zipcode`, `email`, `phone`, `first_name`, `last_name`, `city`) VALUES (3, '12314 street', 'ew', '12344', '24e@gasdf.com', '123=-123-23-32', 'Miles', 'Grandin', 'Highlands Ranch');
INSERT INTO `contact` (`id`, `street`, `state`, `zipcode`, `email`, `phone`, `first_name`, `last_name`, `city`) VALUES (4, 'street', 'sd', '5235', 'asdf@gmasd.com', '1233-221-1-1-1', 'Ryan', 'Grillo', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `dsdb`;
INSERT INTO `user` (`id`, `user_name`, `password`, `sitter`, `contact_id`, `balance`) VALUES (1, 'Eric', 'asdf12', true, 1, 0.0);
INSERT INTO `user` (`id`, `user_name`, `password`, `sitter`, `contact_id`, `balance`) VALUES (2, 'Mike', 'asdf12', false, 2, 0.0);
INSERT INTO `user` (`id`, `user_name`, `password`, `sitter`, `contact_id`, `balance`) VALUES (3, 'Miles', 'asdf12', false, 3, 0.0);
INSERT INTO `user` (`id`, `user_name`, `password`, `sitter`, `contact_id`, `balance`) VALUES (4, 'Ryan', 'asdf12', true, 4, 0.0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dog`
-- -----------------------------------------------------
START TRANSACTION;
USE `dsdb`;
INSERT INTO `dog` (`id`, `name`, `weight`, `img_url`, `user_id`) VALUES (1, 'a', 25, 'https://www.rover.com/blog/wp-content/uploads/2014/12/Bilbo-Baggins-Hobbit-Pug-600x340.jpg', 1);
INSERT INTO `dog` (`id`, `name`, `weight`, `img_url`, `user_id`) VALUES (2, 'b', 35, 'https://www.cesarsway.com/sites/newcesarsway/files/styles/large_article_preview/public/Natural-Dog-Law-2-To-dogs%2C-energy-is-everything.jpg?itok=Z-ujUOUr', 1);
INSERT INTO `dog` (`id`, `name`, `weight`, `img_url`, `user_id`) VALUES (3, 'c', 23, 'http://www.cdc.gov/features/dog-bite-prevention/dog-bite-prevention_456px.jpg', 2);
INSERT INTO `dog` (`id`, `name`, `weight`, `img_url`, `user_id`) VALUES (4, 'd', 12, 'https://www.what-dog.net/Images/faces2/scroll0014.jpg', 2);
INSERT INTO `dog` (`id`, `name`, `weight`, `img_url`, `user_id`) VALUES (5, 'e', 1, 'https://i.ytimg.com/vi/nomNd-1zBl8/maxresdefault.jpg', 3);
INSERT INTO `dog` (`id`, `name`, `weight`, `img_url`, `user_id`) VALUES (6, 'f', 50, 'https://static-cdn.jtvnw.net/jtv_user_pictures/hsdogdog-profile_image-5550ade194780dfc-300x300.jpeg', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `sitter`
-- -----------------------------------------------------
START TRANSACTION;
USE `dsdb`;
INSERT INTO `sitter` (`id`, `size_pref`, `user_id`, `average_rating`, `rate`, `availability`) VALUES (1, 'SMALL', 1, 3, 30.00, NULL);
INSERT INTO `sitter` (`id`, `size_pref`, `user_id`, `average_rating`, `rate`, `availability`) VALUES (2, 'LARGE', 4, 3, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `appointment`
-- -----------------------------------------------------
START TRANSACTION;
USE `dsdb`;
INSERT INTO `appointment` (`id`, `start_date`, `end_date`, `dog_id`, `sitter_id`, `rating`) VALUES (1, '2016-02-12 12:22:00', '2016-02-12 1:22:00', 3, 1, 2);
INSERT INTO `appointment` (`id`, `start_date`, `end_date`, `dog_id`, `sitter_id`, `rating`) VALUES (2, '2016-02-12 13:12:00', NULL, 4, 1, 2);
INSERT INTO `appointment` (`id`, `start_date`, `end_date`, `dog_id`, `sitter_id`, `rating`) VALUES (3, '2016-02-12 13:12:00', NULL, 6, 1, 3);
INSERT INTO `appointment` (`id`, `start_date`, `end_date`, `dog_id`, `sitter_id`, `rating`) VALUES (4, '2016-02-12 13:12:00', NULL, 5, 2, 4);
INSERT INTO `appointment` (`id`, `start_date`, `end_date`, `dog_id`, `sitter_id`, `rating`) VALUES (5, '2016-02-12 12:22:00', '2016-02-12 1:22:00', 3, 2, 3);
INSERT INTO `appointment` (`id`, `start_date`, `end_date`, `dog_id`, `sitter_id`, `rating`) VALUES (6, '2016-02-12 13:12:00', NULL, 4, 2, 4);

COMMIT;

