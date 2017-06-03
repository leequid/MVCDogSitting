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
  PRIMARY KEY (`id`),
  INDEX `contact_id_idx` (`contact_id` ASC),
  CONSTRAINT `contact_id`
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
  `user_id` INT NOT NULL,
  `weight` INT NULL,
  `img_url` VARCHAR(100) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_dog_user_idx` (`user_id` ASC),
  CONSTRAINT `dog_user_id`
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
  `size_pref` VARCHAR(20) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `appointment` ;

CREATE TABLE IF NOT EXISTS `appointment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sitter_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `sitter_id_idx` (`sitter_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `sitter_id`
    FOREIGN KEY (`sitter_id`)
    REFERENCES `sitter` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dog_appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dog_appointment` ;

CREATE TABLE IF NOT EXISTS `dog_appointment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dog_id` INT NOT NULL,
  `appointment_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `appointment_id_idx` (`appointment_id` ASC),
  INDEX `dog_id_idx` (`dog_id` ASC),
  CONSTRAINT `dog_id`
    FOREIGN KEY (`dog_id`)
    REFERENCES `dog` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `appointment_id`
    FOREIGN KEY (`appointment_id`)
    REFERENCES `appointment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_sitter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_sitter` ;

CREATE TABLE IF NOT EXISTS `user_has_sitter` (
  `user_id` INT NOT NULL,
  `sitter_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `sitter_id`),
  INDEX `fk_user_has_sitter_sitter1_idx` (`sitter_id` ASC),
  INDEX `fk_user_has_sitter_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_sitter_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_sitter_sitter1`
    FOREIGN KEY (`sitter_id`)
    REFERENCES `sitter` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO admin;
 DROP USER admin;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'admin' IDENTIFIED BY 'admin';

GRANT ALL ON * TO 'admin';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `contact`
-- -----------------------------------------------------
START TRANSACTION;
USE `dsdb`;
INSERT INTO `contact` (`id`, `street`, `state`, `zipcode`, `email`, `phone`) VALUES (1, '123123 street', 'co', '23924', 'erwer@asdklj.com', '123-1233-2323');
INSERT INTO `contact` (`id`, `street`, `state`, `zipcode`, `email`, `phone`) VALUES (2, '12314 street', 'as', '13142', 'test@agsdkg.com', '123-444-4555');
INSERT INTO `contact` (`id`, `street`, `state`, `zipcode`, `email`, `phone`) VALUES (3, '12314 street', 'ew', '12344', '24e@gasdf.com', '123=-123-23-32');
INSERT INTO `contact` (`id`, `street`, `state`, `zipcode`, `email`, `phone`) VALUES (4, 'street', 'sd', '5235', 'asdf@gmasd.com', '1233-221-1-1-1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `dsdb`;
INSERT INTO `user` (`id`, `user_name`, `password`, `sitter`, `contact_id`) VALUES (1, 'Eric', '1', true, 1);
INSERT INTO `user` (`id`, `user_name`, `password`, `sitter`, `contact_id`) VALUES (2, 'Mike', '2', false, 2);
INSERT INTO `user` (`id`, `user_name`, `password`, `sitter`, `contact_id`) VALUES (3, 'Miles', '3', false, 3);
INSERT INTO `user` (`id`, `user_name`, `password`, `sitter`, `contact_id`) VALUES (4, 'Ryan', '4', true, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dog`
-- -----------------------------------------------------
START TRANSACTION;
USE `dsdb`;
INSERT INTO `dog` (`id`, `name`, `user_id`, `weight`, `img_url`) VALUES (1, 'a', 1, 25, NULL);
INSERT INTO `dog` (`id`, `name`, `user_id`, `weight`, `img_url`) VALUES (2, 'b', 1, 35, NULL);
INSERT INTO `dog` (`id`, `name`, `user_id`, `weight`, `img_url`) VALUES (3, 'c', 2, 23, NULL);
INSERT INTO `dog` (`id`, `name`, `user_id`, `weight`, `img_url`) VALUES (4, 'd', 2, 12, NULL);
INSERT INTO `dog` (`id`, `name`, `user_id`, `weight`, `img_url`) VALUES (5, 'e', 3, 1, NULL);
INSERT INTO `dog` (`id`, `name`, `user_id`, `weight`, `img_url`) VALUES (6, 'f', 4, 50, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `sitter`
-- -----------------------------------------------------
START TRANSACTION;
USE `dsdb`;
INSERT INTO `sitter` (`id`, `size_pref`) VALUES (1, 'small');
INSERT INTO `sitter` (`id`, `size_pref`) VALUES (2, 'big');

COMMIT;


-- -----------------------------------------------------
-- Data for table `appointment`
-- -----------------------------------------------------
START TRANSACTION;
USE `dsdb`;
INSERT INTO `appointment` (`id`, `sitter_id`, `user_id`, `date`) VALUES (1, 1, 2, '2016-02-12 12:22:00');
INSERT INTO `appointment` (`id`, `sitter_id`, `user_id`, `date`) VALUES (2, 1, 4, '2016-02-12 13:12:00');
INSERT INTO `appointment` (`id`, `sitter_id`, `user_id`, `date`) VALUES (3, 2, 3, '2016-02-12 13:12:00');
INSERT INTO `appointment` (`id`, `sitter_id`, `user_id`, `date`) VALUES (4, 2, 2, '2016-02-12 13:12:00');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dog_appointment`
-- -----------------------------------------------------
START TRANSACTION;
USE `dsdb`;
INSERT INTO `dog_appointment` (`id`, `dog_id`, `appointment_id`) VALUES (1, 3, 1);
INSERT INTO `dog_appointment` (`id`, `dog_id`, `appointment_id`) VALUES (2, 4, 1);
INSERT INTO `dog_appointment` (`id`, `dog_id`, `appointment_id`) VALUES (3, 6, 2);
INSERT INTO `dog_appointment` (`id`, `dog_id`, `appointment_id`) VALUES (4, 5, 3);
INSERT INTO `dog_appointment` (`id`, `dog_id`, `appointment_id`) VALUES (5, 3, 4);
INSERT INTO `dog_appointment` (`id`, `dog_id`, `appointment_id`) VALUES (6, 4, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_has_sitter`
-- -----------------------------------------------------
START TRANSACTION;
USE `dsdb`;
INSERT INTO `user_has_sitter` (`user_id`, `sitter_id`) VALUES (1, 1);
INSERT INTO `user_has_sitter` (`user_id`, `sitter_id`) VALUES (4, 2);

COMMIT;

