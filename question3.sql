-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema question3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema question3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `question3` ;
USE `question3` ;

-- -----------------------------------------------------
-- Table `question3`.`Diseases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `question3`.`Diseases` (
  `code` INT NOT NULL,
  `name_disease` VARCHAR(60) NOT NULL,
  `description_syndrome` VARCHAR(250) NOT NULL,
  `affected gene` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `question3`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `question3`.`Patient` (
  `ID` INT NOT NULL,
  `name` VARCHAR(60) NOT NULL,
  `age (disease discovered)` INT NOT NULL,
  `gender` ENUM("M", "V") NOT NULL,
  `diseaseID` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Patient_1_idx` (`diseaseID` ASC) VISIBLE,
  CONSTRAINT `fk_Patient_1`
    FOREIGN KEY (`diseaseID`)
    REFERENCES `question3`.`Diseases` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `question3`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `question3`.`Gene` (
  `ID` INT NOT NULL,
  `gene_name` VARCHAR(45) NOT NULL,
  `start` INT NOT NULL,
  `end` INT NOT NULL,
  `chromosome` ENUM("1-22", "X", "Y") NOT NULL,
  `description affected gene` VARCHAR(250) NOT NULL,
  `patientID` INT NOT NULL,
  `diseaseID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Gene_1_idx` (`diseaseID` ASC) VISIBLE,
  INDEX `fk_Gene_2_idx` (`patientID` ASC) VISIBLE,
  CONSTRAINT `fk_Gene_1`
    FOREIGN KEY (`diseaseID`)
    REFERENCES `question3`.`Diseases` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Gene_2`
    FOREIGN KEY (`patientID`)
    REFERENCES `question3`.`Patient` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
