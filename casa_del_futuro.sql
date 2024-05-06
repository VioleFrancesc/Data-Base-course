-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema casa_del_futuro
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema casa_del_futuro
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `casa_del_futuro` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `casa_del_futuro` ;

-- -----------------------------------------------------
-- Table `casa_del_futuro`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `casa_del_futuro`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `casa_del_futuro`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `casa_del_futuro`.`cursos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `fecha_init` DATE NOT NULL,
  `fecha_fin` DATE NOT NULL,
  `dias_cursada` VARCHAR(45) NOT NULL,
  `programa` VARCHAR(45) NOT NULL,
  `imagen` LONGTEXT NOT NULL,
  `categorias_id` INT NOT NULL,
  PRIMARY KEY (`id`, `categorias_id`),
  INDEX `fk_cursos_categorias1_idx` (`categorias_id` ASC) VISIBLE,
  CONSTRAINT `fk_cursos_categorias1`
    FOREIGN KEY (`categorias_id`)
    REFERENCES `casa_del_futuro`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `casa_del_futuro`.`domicilio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `casa_del_futuro`.`domicilio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `provincia` VARCHAR(20) NULL DEFAULT NULL,
  `localidad` VARCHAR(20) NULL DEFAULT NULL,
  `calle` VARCHAR(40) NULL DEFAULT NULL,
  `altura` INT NULL DEFAULT NULL,
  `piso` INT NULL DEFAULT NULL,
  `departamento` VARCHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `casa_del_futuro`.`modulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `casa_del_futuro`.`modulos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(60) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `duracion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `casa_del_futuro`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `casa_del_futuro`.`rol` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rol` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `casa_del_futuro`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `casa_del_futuro`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NOT NULL,
  `apellido` VARCHAR(60) NOT NULL,
  `dni` INT NOT NULL,
  `correo` VARCHAR(100) NULL DEFAULT NULL,
  `contrasenia` VARCHAR(30) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  `rol_id1` INT NOT NULL,
  `domicilio_id1` INT NOT NULL,
  PRIMARY KEY (`id`, `rol_id1`, `domicilio_id1`),
  INDEX `fk_usuario_rol1_idx` (`rol_id1` ASC) VISIBLE,
  INDEX `fk_usuario_domicilio1_idx` (`domicilio_id1` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_rol1`
    FOREIGN KEY (`rol_id1`)
    REFERENCES `casa_del_futuro`.`rol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_domicilio1`
    FOREIGN KEY (`domicilio_id1`)
    REFERENCES `casa_del_futuro`.`domicilio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `casa_del_futuro`.`usuario_has_cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `casa_del_futuro`.`usuario_has_cursos` (
  `usuario_id` INT NOT NULL,
  `cursos_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `cursos_id`),
  INDEX `fk_usuario_has_cursos_cursos1_idx` (`cursos_id` ASC) VISIBLE,
  INDEX `fk_usuario_has_cursos_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_has_cursos_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `casa_del_futuro`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_cursos_cursos1`
    FOREIGN KEY (`cursos_id`)
    REFERENCES `casa_del_futuro`.`cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
