-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Hotel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Hotel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Hotel` DEFAULT CHARACTER SET utf8 ;
USE `Hotel` ;

-- -----------------------------------------------------
-- Table `Hotel`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`users` (
  `user_id` INT NOT NULL,
  `user_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel`.`rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`rooms` (
  `room_id` INT NOT NULL,
  `room_name` VARCHAR(45) NULL,
  `room_size` VARCHAR(45) NULL,
  PRIMARY KEY (`room_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`bookings` (
  `room_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `booking_id` INT NOT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `fk_rooms_has_users_users1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_rooms_has_users_rooms_idx` (`room_id` ASC) VISIBLE,
  CONSTRAINT `fk_rooms_has_users_rooms`
    FOREIGN KEY (`room_id`)
    REFERENCES `Hotel`.`rooms` (`room_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rooms_has_users_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `Hotel`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`payments` (
  `payments_id` INT NOT NULL,
  `booking_id` INT NOT NULL,
  PRIMARY KEY (`payments_id`),
  INDEX `fk_payments_bookings1_idx` (`booking_id` ASC) VISIBLE,
  CONSTRAINT `fk_payments_bookings1`
    FOREIGN KEY (`booking_id`)
    REFERENCES `Hotel`.`bookings` (`booking_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
