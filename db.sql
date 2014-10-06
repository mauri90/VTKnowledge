-- MySQL Script generated by MySQL Workbench
-- Sat Oct  4 00:47:25 2014
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` VARCHAR(60) NOT NULL,
  `firstName` VARCHAR(45) NULL DEFAULT NULL,
  `lastName` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(345) NULL DEFAULT NULL,
  `user` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `image` VARCHAR(45) NULL DEFAULT NULL,
  `gender` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`question` ;

CREATE TABLE IF NOT EXISTS `mydb`.`question` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(45) NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `vote` INT NULL DEFAULT NULL,
  `user_id` VARCHAR(60) NOT NULL,
  `user_id1` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_question_user_idx` (`user_id` ASC),
  INDEX `fk_question_user1_idx` (`user_id1` ASC),
  CONSTRAINT `fk_question_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_user1`
    FOREIGN KEY (`user_id1`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`topic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`topic` ;

CREATE TABLE IF NOT EXISTS `mydb`.`topic` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`answer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`answer` ;

CREATE TABLE IF NOT EXISTS `mydb`.`answer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(45) NULL DEFAULT NULL,
  `vote` INT NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `user_id` VARCHAR(60) NOT NULL,
  `question_id` INT NOT NULL,
  PRIMARY KEY (`id`, `question_id`),
  INDEX `fk_answer_user1_idx` (`user_id` ASC),
  INDEX `fk_answer_question1_idx` (`question_id` ASC),
  CONSTRAINT `fk_answer_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `mydb`.`question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`question_has_topic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`question_has_topic` ;

CREATE TABLE IF NOT EXISTS `mydb`.`question_has_topic` (
  `question_id` INT NOT NULL,
  `topic_id` INT NOT NULL,
  PRIMARY KEY (`question_id`, `topic_id`),
  INDEX `fk_question_has_topic_topic1_idx` (`topic_id` ASC),
  INDEX `fk_question_has_topic_question1_idx` (`question_id` ASC),
  CONSTRAINT `fk_question_has_topic_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `mydb`.`question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_has_topic_topic1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `mydb`.`topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_has_topic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user_has_topic` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user_has_topic` (
  `user_id` VARCHAR(60) NOT NULL,
  `topic_id` INT NOT NULL,
  `validation` VARCHAR(45) NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `topic_id`),
  INDEX `fk_user_has_topic_topic1_idx` (`topic_id` ASC),
  INDEX `fk_user_has_topic_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_topic_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_topic_topic1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `mydb`.`topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;