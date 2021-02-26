CREATE SCHEMA `hospital_project` ;
CREATE TABLE `hospital_project`.`patient` (
  `pid` INT NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  `age` INT NOT NULL,
  `weight` INT NOT NULL,
  `gender` VARCHAR(10) NOT NULL,
  `address` VARCHAR(50) NOT NULL,
  `phone` INT NOT NULL,
  `disease` VARCHAR(25) NOT NULL,
  `doctorid` INT NOT NULL,
  PRIMARY KEY (`pid`));
  CREATE TABLE `hospital_project`.`doctor` (
  `doctorid` INT NOT NULL,
  `Name` VARCHAR(25) NOT NULL,
  `Department` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`doctorid`));
CREATE TABLE `hospital_project`.`lab` (
  `lab id` INT NOT NULL,
  `pid` INT NOT NULL,
  `doctorid` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `category` VARCHAR(20) NOT NULL,
  `amount` INT NOT NULL,
  PRIMARY KEY (`lab id`),
  INDEX `doctorid_idx` (`doctorid` ASC) VISIBLE,
  CONSTRAINT `doctorid`
    FOREIGN KEY (`doctorid`)
    REFERENCES `hospital_project`.`doctor` (`doctorid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE TABLE `hospital_project`.`inpatient` (
  `pid` INT NOT NULL,
  `room_num` INT NOT NULL,
  `admission` DATETIME NOT NULL,
  `discharge` DATETIME NOT NULL,
  `lab id` INT NOT NULL,
  PRIMARY KEY (`pid`),
  INDEX `lab id_idx` (`lab id` ASC) VISIBLE,
  CONSTRAINT `lab id`
    FOREIGN KEY (`lab id`)
    REFERENCES `hospital_project`.`lab` (`lab id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE TABLE `hospital_project`.`outpatient` (
  `pid` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `lab id` INT NOT NULL,
  PRIMARY KEY (`pid`),
  INDEX `lab id_idx` (`lab id` ASC) VISIBLE,
  CONSTRAINT `lab id2`
    FOREIGN KEY (`lab id`)
    REFERENCES `hospital_project`.`lab` (`lab id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE TABLE `hospital_project`.`room` (
  `room number` INT NOT NULL,
  `room type` VARCHAR(15) NOT NULL,
  `status` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`room number`));
CREATE TABLE `hospital_project`.`bill` (
  `bill id` INT NOT NULL,
  `pid` INT NOT NULL,
  `patient type` VARCHAR(20) NULL,
  `doctor cost` INT NOT NULL,
  `medicine cost` INT NOT NULL,
  `room cost` INT NOT NULL,
  `operation cost` INT NULL,
  `days spent` INT NULL,
  `nursing cost` INT NULL,
  `health card` VARCHAR(45) NULL,
  `lab cost` INT NOT NULL,
  `total due` INT NOT NULL,
  PRIMARY KEY (`bill id`),
  INDEX `pid_idx` (`pid` ASC) VISIBLE,
  CONSTRAINT `pid`
    FOREIGN KEY (`pid`)
    REFERENCES `hospital_project`.`patient` (`pid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);




