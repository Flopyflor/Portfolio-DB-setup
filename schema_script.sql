-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Portfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Portfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Portfolio` DEFAULT CHARACTER SET utf8 ;
USE `Portfolio` ;

-- -----------------------------------------------------
-- Table `Portfolio`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio`.`Persona` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT '',
  `descripcion` VARCHAR(400) NULL DEFAULT '',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio`.`Tipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio`.`Tipos` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio`.`Seccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio`.`Seccion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT '',
  `Tipos_id` INT NOT NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Seccion_Tipos`
    FOREIGN KEY (`Tipos_id`)
    REFERENCES `Portfolio`.`Tipos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Seccion_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `Portfolio`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio`.`Tarjeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio`.`Tarjeta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NULL DEFAULT '',
  `descripcion` VARCHAR(200) NULL DEFAULT '',
  `link` VARCHAR(200) NULL,
  `Seccion_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Tarjeta_Seccion1`
    FOREIGN KEY (`Seccion_id`)
    REFERENCES `Portfolio`.`Seccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
