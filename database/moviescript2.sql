-- MySQL Script generated by MySQL Workbench
-- vie 24 sep 2021 10:25:56
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema movies
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `movies` ;

-- -----------------------------------------------------
-- Schema movies
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `movies` ;
USE `movies` ;

-- -----------------------------------------------------
-- Table `movies`.`movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`movie` ;

CREATE TABLE IF NOT EXISTS `movies`.`movie` (
  `mov_id` INT NOT NULL AUTO_INCREMENT,
  `mov_title` VARCHAR(40) NOT NULL,
  `mov_year` INT NOT NULL,
  `mov_time` INT NOT NULL,
  `mov_lang` VARCHAR(20) NOT NULL,
  `mov_dt_rel` DATE NULL,
  `mov_rel_country` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`mov_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies`.`reviewer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`reviewer` ;

CREATE TABLE IF NOT EXISTS `movies`.`reviewer` (
  `rev_id` INT NOT NULL,
  `rev_name` VARCHAR(30) NULL,
  PRIMARY KEY (`rev_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies`.`actor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`actor` ;

CREATE TABLE IF NOT EXISTS `movies`.`actor` (
  `act_id` INT NOT NULL AUTO_INCREMENT,
  `act_fname` VARCHAR(30) NOT NULL,
  `act_lname` VARCHAR(30) NOT NULL,
  `act_gender` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`act_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies`.`director`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`director` ;

CREATE TABLE IF NOT EXISTS `movies`.`director` (
  `dir_id` INT NOT NULL,
  `dir_fname` VARCHAR(50) NOT NULL,
  `dir_lname` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`dir_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies`.`genres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`genres` ;

CREATE TABLE IF NOT EXISTS `movies`.`genres` (
  `gen_id` INT NOT NULL,
  `gen_title` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`gen_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies`.`movie_genres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`movie_genres` ;

CREATE TABLE IF NOT EXISTS `movies`.`movie_genres` (
  `movie_mov _id` INT NOT NULL,
  `genres_gen_id` INT NOT NULL,
  PRIMARY KEY (`movie_mov _id`, `genres_gen_id`),
  INDEX `fk_movie_has_genres_genres1_idx` (`genres_gen_id` ASC) VISIBLE,
  INDEX `fk_movie_has_genres_movie1_idx` (`movie_mov _id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = ascii;


-- -----------------------------------------------------
-- Table `movies`.`rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`rating` ;

CREATE TABLE IF NOT EXISTS `movies`.`rating` (
  `mov_id` INT NOT NULL,
  `rev_id` INT NOT NULL,
  `rev_stars` FLOAT(10,2) NULL,
  `num_o_ratings` INT NULL,
  PRIMARY KEY (`mov_id`, `rev_id`),
  INDEX `fk_movie_has_reviewer_reviewer1_idx` (`rev_id` ASC) VISIBLE,
  INDEX `fk_movie_has_reviewer_movie1_idx` (`mov_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = ascii;


-- -----------------------------------------------------
-- Table `movies`.`movie_cast`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`movie_cast` ;

CREATE TABLE IF NOT EXISTS `movies`.`movie_cast` (
  `actor_act_id` INT NOT NULL,
  `movie_mov_id` INT NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`actor_act_id`, `movie_mov_id`),
  INDEX `fk_actor_has_movie_movie1_idx` (`movie_mov_id` ASC) VISIBLE,
  INDEX `fk_actor_has_movie_actor1_idx` (`actor_act_id` ASC) VISIBLE,
  CONSTRAINT `fk_actor_has_movie_actor1`
    FOREIGN KEY (`actor_act_id`)
    REFERENCES `movies`.`actor` (`act_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actor_has_movie_movie1`
    FOREIGN KEY (`movie_mov_id`)
    REFERENCES `movies`.`movie` (`mov_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies`.`movie-direction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movies`.`movie-direction` ;

CREATE TABLE IF NOT EXISTS `movies`.`movie-direction` (
  `dir_id` INT NOT NULL,
  `mov_id` INT NOT NULL,
  PRIMARY KEY (`dir_id`, `mov_id`),
  INDEX `fk_director_has_movie_movie1_idx` (`mov_id` ASC) VISIBLE,
  INDEX `fk_director_has_movie_director1_idx` (`dir_id` ASC) VISIBLE,
  CONSTRAINT `fk_director_has_movie_director1`
    FOREIGN KEY (`dir_id`)
    REFERENCES `movies`.`director` (`dir_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_director_has_movie_movie1`
    FOREIGN KEY (`mov_id`)
    REFERENCES `movies`.`movie` (`mov_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `movies`.`movie`
-- -----------------------------------------------------
START TRANSACTION;
USE `movies`;
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (901, ' Vertigo', 1958, 128, ' English', '       1958-08-24', ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (902, ' The Innocents', 1961, 100, ' English', '       1962-02-19', ' SW');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (903, ' Lawrence of Arabia', 1962, 216, ' English', '       1962-12-11', ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (904, ' The Deer Hunter', 1978, 183, ' English', '       1979-03-08', ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (905, ' Amadeus', 1984, 160, ' English', '       1985-01-07', ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (906, ' Blade Runner', 1982, 117, ' English', '       1982-09-09', ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (907, ' Eyes Wide Shut', 1999, 159, ' English', NULL, ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (908, ' The Usual Suspects', 1995, 106, ' English', '       1995-08-25', ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (909, ' Chinatown', 1974, 130, ' English', '       1974-08-09', ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (910, ' Boogie Nights', 1997, 155, ' English', '       1998-02-16', ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (911, ' Annie Hall', 1977, 93, ' English', '       1977-04-20', ' USA');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (912, ' Princess Mononoke', 1997, 134, ' Japanese', '       2001-10-19', ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (913, ' The Shawshank Redemption', 1994, 142, ' English', '       1995-02-17', ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (914, ' American Beauty', 1999, 122, ' English', NULL, ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (915, ' Titanic', 1997, 194, ' English', '       1998-01-23', ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (916, ' Good Will Hunting', 1997, 126, ' English', '       1998-06-03', ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (917, ' Deliverance', 1972, 109, ' English', '       1982-10-05', ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (918, ' Trainspotting', 1996, 94, ' English', '       1996-02-23', ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (919, ' The Prestige', 2006, 130, ' English', '       2006-11-10', ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (920, ' Donnie Darko', 2001, 113, ' English', NULL, ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (921, ' Slumdog Millionaire', 2008, 120, ' English', '       2009-01-09', ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (922, ' Aliens', 1986, 137, ' English', '       1986-08-29', ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (923, ' Beyond the Sea', 2004, 118, ' English', '       2004-11-26', ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (924, ' Avatar', 2009, 162, ' English', '       2009-12-17', ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (926, ' Seven Samurai', 1954, 207, ' Japanese', '       1954-04-26', ' JP');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (927, ' Spirited Away', 2001, 125, ' Japanese', '       2003-09-12', ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (928, ' Back to the Future', 1985, 116, ' English', '       1985-12-04', ' UK');
INSERT INTO `movies`.`movie` (`mov_id`, `mov_title`, `mov_year`, `mov_time`, `mov_lang`, `mov_dt_rel`, `mov_rel_country`) VALUES (925, ' Braveheart', 1995, 178, ' English', '       1995-09-08', ' UK');

COMMIT;


-- -----------------------------------------------------
-- Data for table `movies`.`reviewer`
-- -----------------------------------------------------
START TRANSACTION;
USE `movies`;
INSERT INTO `movies`.`reviewer` (`rev_id`, `rev_name`) VALUES (9001, '         Righty Sock');
INSERT INTO `movies`.`reviewer` (`rev_id`, `rev_name`) VALUES (9002, '         Jack Malvern');
INSERT INTO `movies`.`reviewer` (`rev_id`, `rev_name`) VALUES (9003, '         Flagrant Baronessa');
INSERT INTO `movies`.`reviewer` (`rev_id`, `rev_name`) VALUES (9004, '         Alec Shaw');
INSERT INTO `movies`.`reviewer` (`rev_id`, `rev_name`) VALUES (9005, '');
INSERT INTO `movies`.`reviewer` (`rev_id`, `rev_name`) VALUES (9006, '         Victor Woeltjen');
INSERT INTO `movies`.`reviewer` (`rev_id`, `rev_name`) VALUES (9007, '         Simon Wright');
INSERT INTO `movies`.`reviewer` (`rev_id`, `rev_name`) VALUES (9008, '         Neal Wruck');
INSERT INTO `movies`.`reviewer` (`rev_id`, `rev_name`) VALUES (9009, '         Paul Monks');
INSERT INTO `movies`.`reviewer` (`rev_id`, `rev_name`) VALUES (9010, '         Mike Salvati');
INSERT INTO `movies`.`reviewer` (`rev_id`, `rev_name`) VALUES (9011, '');
INSERT INTO `movies`.`reviewer` (`rev_id`, `rev_name`) VALUES (9012, '         Wesley S. Walker');
INSERT INTO `movies`.`reviewer` (`rev_id`, `rev_name`) VALUES (9013, '         Sasha Goldshtein');
INSERT INTO `movies`.`reviewer` (`rev_id`, `rev_name`) VALUES (9014, '         Josh Cates');
INSERT INTO `movies`.`reviewer` (`rev_id`, `rev_name`) VALUES (9015, '         Krug Stillo');
INSERT INTO `movies`.`reviewer` (`rev_id`, `rev_name`) VALUES (9016, '         Scott LeBrun');
INSERT INTO `movies`.`reviewer` (`rev_id`, `rev_name`) VALUES (9017, '         Hannah Steele');
INSERT INTO `movies`.`reviewer` (`rev_id`, `rev_name`) VALUES (9018, '         Vincent Cadena');
INSERT INTO `movies`.`reviewer` (`rev_id`, `rev_name`) VALUES (9019, '         Brandt Sponseller');
INSERT INTO `movies`.`reviewer` (`rev_id`, `rev_name`) VALUES (9020, '         Richard Adams');

COMMIT;


-- -----------------------------------------------------
-- Data for table `movies`.`actor`
-- -----------------------------------------------------
START TRANSACTION;
USE `movies`;
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (101, '   James', '           Stewart', '          M');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (102, '   Deborah', '           Kerr', '          F');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (103, '   Peter', '           OToole', '          M');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (104, '   Robert', '           De Niro', '          M');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (105, '   F. Murray', '           Abraham', '          M');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (106, '   Harrison', '           Ford', '          M');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (107, '   Nicole', '           Kidman', '          F');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (108, '   Stephen', '           Baldwin', '          M');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (109, '   Jack', '           Nicholson', '          M');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (110, '   Mark', '           Wahlberg', '          M');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (111, '   Woody', '           Allen', '          M');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (112, '   Claire', '           Danes', '          F');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (113, '   Tim', '           Robbins', '          M');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (114, '   Kevin', '           Spacey', '          M');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (115, '   Kate', '           Winslet', '          F');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (116, '   Robin', '           Williams', '          M');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (117, '   Jon', '           Voight', '          M');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (118, '   Ewan', '           McGregor', '          M');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (119, '   Christian', '           Bale', '          M');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (120, '   Maggie', '           Gyllenhaal', '          F');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (121, '   Dev', '           Patel', '          M');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (122, '   Sigourney', '           Weaver', '          F');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (123, '   David', '           Aston', '          M');
INSERT INTO `movies`.`actor` (`act_id`, `act_fname`, `act_lname`, `act_gender`) VALUES (124, '   Ali', '           Astin', '          F');

COMMIT;


-- -----------------------------------------------------
-- Data for table `movies`.`director`
-- -----------------------------------------------------
START TRANSACTION;
USE `movies`;
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (201, '  Alfred', '            Hitchcock');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (202, '  Jack', '            Clayton');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (203, '  David', '            Lean');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (204, '  Michael', '            Cimino');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (205, '  Milos', '            Forman');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (206, '  Ridley', '            Scott');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (207, '  Stanley', '            Kubrick');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (208, '  Bryan', '            Singer');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (209, '  Roman', '            Polanski');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (210, '  Paul', '            Thomas Anderson');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (211, '  Woody', '            Allen');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (212, '  Hayao', '            Miyazaki');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (213, '  Frank', '            Darabont');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (214, '  Sam', '            Mendes');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (215, '  James', '            Cameron');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (216, '  Gus', '            Van Sant');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (217, '  John', '            Boorman');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (218, '  Danny', '            Boyle');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (219, '  Christopher', '            Nolan');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (220, '  Richard', '            Kelly');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (221, '  Kevin', '            Spacey');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (222, '  Andrei', '            Tarkovsky');
INSERT INTO `movies`.`director` (`dir_id`, `dir_fname`, `dir_lname`) VALUES (223, '  Peter', '            Jackson');

COMMIT;


-- -----------------------------------------------------
-- Data for table `movies`.`genres`
-- -----------------------------------------------------
START TRANSACTION;
USE `movies`;
INSERT INTO `movies`.`genres` (`gen_id`, `gen_title`) VALUES (1001, 'Action');
INSERT INTO `movies`.`genres` (`gen_id`, `gen_title`) VALUES (1002, 'Adventure');
INSERT INTO `movies`.`genres` (`gen_id`, `gen_title`) VALUES (1003, 'Animation');
INSERT INTO `movies`.`genres` (`gen_id`, `gen_title`) VALUES (1004, 'Biography');
INSERT INTO `movies`.`genres` (`gen_id`, `gen_title`) VALUES (1005, 'Comedy');
INSERT INTO `movies`.`genres` (`gen_id`, `gen_title`) VALUES (1006, 'Crime');
INSERT INTO `movies`.`genres` (`gen_id`, `gen_title`) VALUES (1007, 'Drama');
INSERT INTO `movies`.`genres` (`gen_id`, `gen_title`) VALUES (1008, 'Horror');
INSERT INTO `movies`.`genres` (`gen_id`, `gen_title`) VALUES (1009, 'Music');
INSERT INTO `movies`.`genres` (`gen_id`, `gen_title`) VALUES (1010, 'Mystery');
INSERT INTO `movies`.`genres` (`gen_id`, `gen_title`) VALUES (1011, 'Romance');
INSERT INTO `movies`.`genres` (`gen_id`, `gen_title`) VALUES (1012, 'Thriller');
INSERT INTO `movies`.`genres` (`gen_id`, `gen_title`) VALUES (1013, 'War');

COMMIT;


-- -----------------------------------------------------
-- Data for table `movies`.`movie_genres`
-- -----------------------------------------------------
START TRANSACTION;
USE `movies`;
INSERT INTO `movies`.`movie_genres` (`movie_mov _id`, `genres_gen_id`) VALUES (922, 1001);
INSERT INTO `movies`.`movie_genres` (`movie_mov _id`, `genres_gen_id`) VALUES (917, 1002);
INSERT INTO `movies`.`movie_genres` (`movie_mov _id`, `genres_gen_id`) VALUES (903, 1002);
INSERT INTO `movies`.`movie_genres` (`movie_mov _id`, `genres_gen_id`) VALUES (912, 1003);
INSERT INTO `movies`.`movie_genres` (`movie_mov _id`, `genres_gen_id`) VALUES (911, 1005);
INSERT INTO `movies`.`movie_genres` (`movie_mov _id`, `genres_gen_id`) VALUES (908, 1006);
INSERT INTO `movies`.`movie_genres` (`movie_mov _id`, `genres_gen_id`) VALUES (913, 1006);
INSERT INTO `movies`.`movie_genres` (`movie_mov _id`, `genres_gen_id`) VALUES (926, 1007);
INSERT INTO `movies`.`movie_genres` (`movie_mov _id`, `genres_gen_id`) VALUES (928, 1007);
INSERT INTO `movies`.`movie_genres` (`movie_mov _id`, `genres_gen_id`) VALUES (918, 1007);
INSERT INTO `movies`.`movie_genres` (`movie_mov _id`, `genres_gen_id`) VALUES (921, 1007);
INSERT INTO `movies`.`movie_genres` (`movie_mov _id`, `genres_gen_id`) VALUES (902, 1008);
INSERT INTO `movies`.`movie_genres` (`movie_mov _id`, `genres_gen_id`) VALUES (923, 1009);
INSERT INTO `movies`.`movie_genres` (`movie_mov _id`, `genres_gen_id`) VALUES (907, 1010);
INSERT INTO `movies`.`movie_genres` (`movie_mov _id`, `genres_gen_id`) VALUES (927, 1010);
INSERT INTO `movies`.`movie_genres` (`movie_mov _id`, `genres_gen_id`) VALUES (901, 1010);
INSERT INTO `movies`.`movie_genres` (`movie_mov _id`, `genres_gen_id`) VALUES (914, 1011);
INSERT INTO `movies`.`movie_genres` (`movie_mov _id`, `genres_gen_id`) VALUES (906, 1012);
INSERT INTO `movies`.`movie_genres` (`movie_mov _id`, `genres_gen_id`) VALUES (904, 1013);

COMMIT;


-- -----------------------------------------------------
-- Data for table `movies`.`rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `movies`;
INSERT INTO `movies`.`rating` (`mov_id`, `rev_id`, `rev_stars`, `num_o_ratings`) VALUES (901, 9001,                8.40, 263575);
INSERT INTO `movies`.`rating` (`mov_id`, `rev_id`, `rev_stars`, `num_o_ratings`) VALUES (902, 9002,                7.90, 20207);
INSERT INTO `movies`.`rating` (`mov_id`, `rev_id`, `rev_stars`, `num_o_ratings`) VALUES (903, 9003,                8.30, 202778);
INSERT INTO `movies`.`rating` (`mov_id`, `rev_id`, `rev_stars`, `num_o_ratings`) VALUES (906, 9005,                8.20, 484746);
INSERT INTO `movies`.`rating` (`mov_id`, `rev_id`, `rev_stars`, `num_o_ratings`) VALUES (924, 9006,                7.30, NULL );
INSERT INTO `movies`.`rating` (`mov_id`, `rev_id`, `rev_stars`, `num_o_ratings`) VALUES (908, 9007,                8.60, 779489);
INSERT INTO `movies`.`rating` (`mov_id`, `rev_id`, `rev_stars`, `num_o_ratings`) VALUES (909, 9008,NULL , 227235);
INSERT INTO `movies`.`rating` (`mov_id`, `rev_id`, `rev_stars`, `num_o_ratings`) VALUES (910, 9009,                3.00, 195961);
INSERT INTO `movies`.`rating` (`mov_id`, `rev_id`, `rev_stars`, `num_o_ratings`) VALUES (911, 9010,                8.10, 203875);
INSERT INTO `movies`.`rating` (`mov_id`, `rev_id`, `rev_stars`, `num_o_ratings`) VALUES (912, 9011,                8.40,NULL );
INSERT INTO `movies`.`rating` (`mov_id`, `rev_id`, `rev_stars`, `num_o_ratings`) VALUES (914, 9013,                7.00, 862618);
INSERT INTO `movies`.`rating` (`mov_id`, `rev_id`, `rev_stars`, `num_o_ratings`) VALUES (915, 9001,                7.70, 830095);
INSERT INTO `movies`.`rating` (`mov_id`, `rev_id`, `rev_stars`, `num_o_ratings`) VALUES (916, 9014,                4.00, 642132);
INSERT INTO `movies`.`rating` (`mov_id`, `rev_id`, `rev_stars`, `num_o_ratings`) VALUES (925, 9015,                7.70, 81328);
INSERT INTO `movies`.`rating` (`mov_id`, `rev_id`, `rev_stars`, `num_o_ratings`) VALUES (918, 9016, NULL, 580301);
INSERT INTO `movies`.`rating` (`mov_id`, `rev_id`, `rev_stars`, `num_o_ratings`) VALUES (920, 9017,                8.10, 609451);
INSERT INTO `movies`.`rating` (`mov_id`, `rev_id`, `rev_stars`, `num_o_ratings`) VALUES (921, 9018,                8.00, 667758);
INSERT INTO `movies`.`rating` (`mov_id`, `rev_id`, `rev_stars`, `num_o_ratings`) VALUES (922, 9019,                8.40, 511613);
INSERT INTO `movies`.`rating` (`mov_id`, `rev_id`, `rev_stars`, `num_o_ratings`) VALUES (923, 9020,                6.70, 13091);

COMMIT;


-- -----------------------------------------------------
-- Data for table `movies`.`movie_cast`
-- -----------------------------------------------------
START TRANSACTION;
USE `movies`;
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (101, 901, '   John Scottie Ferguson');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (102, 902, '   Miss Giddens');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (103, 903, '   T.E. Lawrence');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (104, 904, '   Michael');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (105, 905, '   Antonio Salieri');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (106, 906, '   Rick Deckard');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (107, 907, '   Alice Harford');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (108, 908, '   McManus');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (110, 910, '   Eddie Adams');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (111, 911, '   Alvy Singer');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (112, 912, '   San');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (113, 913, '   Andy Dufresne');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (114, 914, '   Lester Burnham');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (115, 915, '   Rose DeWitt Bukater');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (116, 916, '   Sean Maguire');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (117, 917, '   Ed');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (118, 918, '   Renton');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (120, 920, '   Elizabeth Darko');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (121, 921, '   Older Jamal');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (122, 922, '   Ripley');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (114, 923, '   Bobby Darin');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (109, 909, '   J.J. Gittes');
INSERT INTO `movies`.`movie_cast` (`actor_act_id`, `movie_mov_id`, `role`) VALUES (119, 919, '   Alfred Borden');

COMMIT;


-- -----------------------------------------------------
-- Data for table `movies`.`movie-direction`
-- -----------------------------------------------------
START TRANSACTION;
USE `movies`;
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (201, 901);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (202, 902);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (203, 903);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (204, 904);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (205, 905);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (206, 906);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (207, 907);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (208, 908);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (209, 909);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (210, 910);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (211, 911);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (212, 912);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (213, 913);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (214, 914);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (215, 915);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (216, 916);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (217, 917);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (218, 918);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (219, 919);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (220, 920);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (218, 921);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (215, 922);
INSERT INTO `movies`.`movie-direction` (`dir_id`, `mov_id`) VALUES (221, 923);

COMMIT;

