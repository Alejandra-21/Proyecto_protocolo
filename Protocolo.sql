-- MySQL Script generated by MySQL Workbench
-- Sun Mar  1 01:34:54 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Protocolo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Protocolo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Protocolo` ;
USE `Protocolo` ;

-- -----------------------------------------------------
-- Table `Protocolo`.`Protocolo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Protocolo`.`Protocolo1` (
  `no_registro` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `ruta_pdf` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`no_registro`),
  INDEX `no_registro` (`no_registro` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Protocolo`.`Alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Protocolo`.`Alumno` (
  `boleta` INT(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45),
  `password` VARCHAR(45),
  `no_registro` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`boleta`),
  INDEX `no_registro_idx` (`no_registro` ASC),
  CONSTRAINT `no_registro_a`
    FOREIGN KEY (`no_registro`)
    REFERENCES `Protocolo`.`Protocolo1` (`no_registro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Protocolo`.`Profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Protocolo`.`Profesor` (
  `idProfesor` INT(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProfesor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Protocolo`.`Academia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Protocolo`.`Academia` (
  `calve` INT(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `presidente` INT(10) NOT NULL,
  PRIMARY KEY (`calve`),
  INDEX `presidente_idx` (`presidente` ASC),
  CONSTRAINT `presidente`
    FOREIGN KEY (`presidente`)
    REFERENCES `Protocolo`.`Profesor` (`idProfesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Protocolo`.`Prof_academia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Protocolo`.`Prof_academia` (
  `clave_academia` INT(10) NOT NULL,
  `idProfesor` INT(10) NOT NULL,
  PRIMARY KEY (`clave_academia`, `idProfesor`),
  INDEX `idProfesor_idx` (`idProfesor` ASC),
  CONSTRAINT `clave_academia_pa`
    FOREIGN KEY (`clave_academia`)
    REFERENCES `Protocolo`.`Academia` (`calve`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProfesor_pa`
    FOREIGN KEY (`idProfesor`)
    REFERENCES `Protocolo`.`Profesor` (`idProfesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Protocolo`.`Evalua`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Protocolo`.`Evalua` (
  `idEvalua` INT NOT NULL,
  `no_registro` VARCHAR(15) NOT NULL,
  `idProfesor` INT(10) NOT NULL,
  `ruta_pdf_eval` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEvalua`),
  INDEX `no_registro_idx` (`no_registro` ASC),
  INDEX `idProfesor_idx` (`idProfesor` ASC),
  CONSTRAINT `no_registro_e`
    FOREIGN KEY (`no_registro`)
    REFERENCES `Protocolo`.`Protocolo1` (`no_registro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProfesor_e`
    FOREIGN KEY (`idProfesor`)
    REFERENCES `Protocolo`.`Profesor` (`idProfesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Protocolo`.`Palabras_clave`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Protocolo`.`Palabras_clave` (
  `no_registro` VARCHAR(15) NOT NULL,
  `p1` VARCHAR(45) NOT NULL,
  `p2` VARCHAR(45) NOT NULL,
  `p3` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`no_registro`),
  INDEX `no_registro_ind` (`no_registro` ASC),
  CONSTRAINT `no_registro_p`
    FOREIGN KEY (`no_registro`)
    REFERENCES `Protocolo`.`Protocolo1` (`no_registro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- INSERTA PROFES --

insert into profesor values (1,"LOPEZ CARRERA BENJAMIN", "LCB1_", "LCB1_");
insert into profesor values (2,"VAZQUEZ ARREGUIN ROBERTO", "VAR2_", "VAR2_");
insert into profesor values (3,"TELLEZ REYES MARIA DEL SOCORRO", "TRMS3_", "TRMS3_");
insert into profesor values (4,"SUAREZ CASTANON MIGUEL SANTIAGO", "SCMS4_", "SCMS4_");
insert into profesor values (5,"CHAVEZ LIMA EDUARDO", "CLE5_", "CLE5_");
insert into profesor values (6,"DORANTES VILLA CLAUDIA JISELA", "DVCJ6_", "DVCJ6_");
insert into profesor values (7,"PEREZ VERA MONSERRAT GABRIELA", "PVMG7_", "PVMG7_");
insert into profesor values (8,"RUEDA MELENDEZ MARCO ANTONIO", "RMMA8_", "RMMA8_");
insert into profesor values (9,"GUZMAN AGUILAR FLORENCIO", "GAF9_", "GAF9_");
insert into profesor values (10,"MUNOZ SALAZAR LAURA", "MSL10_", "MSL10_");

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
