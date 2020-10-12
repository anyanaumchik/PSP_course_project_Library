-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `library` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `library` ;

-- -----------------------------------------------------
-- Table `library`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`users` (
  `idusers` INT(11) NOT NULL AUTO_INCREMENT,
  `lastname` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `status` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE INDEX `idusers_UNIQUE` (`idusers` ASC) VISIBLE,
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 42
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `library`.`archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`archive` (
  `idbookarchive` INT(11) NOT NULL AUTO_INCREMENT,
  `idbook` INT(11) NOT NULL,
  `date` DATE NOT NULL,
  `idadmin` INT(11) NOT NULL,
  `author` VARCHAR(45) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idbookarchive`),
  UNIQUE INDEX `idbookarchive_UNIQUE` (`idbookarchive` ASC) VISIBLE,
  INDEX `idusers_idx` (`idadmin` ASC) VISIBLE,
  CONSTRAINT `iduserskey`
    FOREIGN KEY (`idadmin`)
    REFERENCES `library`.`users` (`idusers`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `library`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`books` (
  `idbooks` INT(11) NOT NULL AUTO_INCREMENT,
  `author` VARCHAR(45) NOT NULL,
  `booktitle` VARCHAR(45) NOT NULL,
  `yearofpublication` INT(11) NOT NULL,
  `numberofpages` INT(11) NOT NULL,
  `format` VARCHAR(45) NOT NULL,
  `material` VARCHAR(45) NOT NULL,
  `coefficient` FLOAT NOT NULL,
  `status` VARCHAR(20) NOT NULL,
  `number` INT(11) NOT NULL,
  PRIMARY KEY (`idbooks`),
  UNIQUE INDEX `idbooks_UNIQUE` (`idbooks` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `library`.`loans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`loans` (
  `idloans` INT(11) NOT NULL AUTO_INCREMENT,
  `iduser` INT(11) NOT NULL,
  `idbook` INT(11) NOT NULL,
  `term` INT(11) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`idloans`),
  UNIQUE INDEX `idloans_UNIQUE` (`idloans` ASC) VISIBLE,
  INDEX `userloan_idx` (`iduser` ASC) VISIBLE,
  INDEX `bookskey_idx` (`idbook` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 29
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `library`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`orders` (
  `idorder` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `author` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `year` INT(11) NOT NULL,
  `pages` INT(11) NOT NULL,
  `material` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `format` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `price` FLOAT NOT NULL,
  `admin` INT(11) NOT NULL,
  `date` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `number` INT(11) NOT NULL,
  PRIMARY KEY (`idorder`),
  UNIQUE INDEX `idorder_UNIQUE` (`idorder` ASC) VISIBLE,
  INDEX `adminn_idx` (`admin` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 53
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
