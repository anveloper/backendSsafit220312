-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ssafit
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ssafit
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ssafit` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ssafit` ;

-- -----------------------------------------------------
-- Table `ssafit`.`fit_part`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ssafit`.`fit_part` ;

CREATE TABLE IF NOT EXISTS `ssafit`.`fit_part` (
  `part_no` INT NOT NULL,
  `part_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`part_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ssafit`.`video`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ssafit`.`video` ;

CREATE TABLE IF NOT EXISTS `ssafit`.`video` (
  `youtube_id` VARCHAR(100) NOT NULL,
  `fit_part_no` INT NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `channel_name` VARCHAR(100) NOT NULL,
  `url` VARCHAR(200) NOT NULL,
  `view_cnt` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`youtube_id`, `fit_part_no`),
  INDEX `video_part_fitno_FK_idx` (`fit_part_no` ASC) VISIBLE,
  CONSTRAINT `video_part_fitno_FK`
    FOREIGN KEY (`fit_part_no`)
    REFERENCES `ssafit`.`fit_part` (`part_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ssafit`.`member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ssafit`.`member` ;

CREATE TABLE IF NOT EXISTS `ssafit`.`member` (
  `member_no` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `nickname` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`member_no`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ssafit`.`review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ssafit`.`review` ;

CREATE TABLE IF NOT EXISTS `ssafit`.`review` (
  `review_no` INT NOT NULL AUTO_INCREMENT,
  `youtube_id` VARCHAR(100) NOT NULL,
  `title` VARCHAR(200) NOT NULL,
  `writer_no` INT NOT NULL,
  `content` VARCHAR(2000) NOT NULL,
  `reg_date` TIMESTAMP NOT NULL DEFAULT now(),
  `view_cnt` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`review_no`),
  INDEX `review_video_youtubeid_FK_idx` (`youtube_id` ASC) VISIBLE,
  INDEX `review_member_id_idx` (`writer_no` ASC) VISIBLE,
  CONSTRAINT `review_video_youtubeid_FK`
    FOREIGN KEY (`youtube_id`)
    REFERENCES `ssafit`.`video` (`youtube_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `review_member_no`
    FOREIGN KEY (`writer_no`)
    REFERENCES `ssafit`.`member` (`member_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ssafit`.`zzim`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ssafit`.`zzim` ;

CREATE TABLE IF NOT EXISTS `ssafit`.`zzim` (
  `member_no` INT NOT NULL,
  `youtube_id` VARCHAR(100) NOT NULL,
  INDEX `zzim_member_no_FK_idx` (`mamber_no` ASC) VISIBLE,
  INDEX `zzim_video_youtube_id_FK_idx` (`youtube_id` ASC) VISIBLE,
  PRIMARY KEY (`mamber_no`, `youtube_id`),
  CONSTRAINT `zzim_member_no_FK`
    FOREIGN KEY (`mamber_no`)
    REFERENCES `ssafit`.`member` (`member_no`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `zzim_video_youtube_id_FK`
    FOREIGN KEY (`youtube_id`)
    REFERENCES `ssafit`.`video` (`youtube_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ssafit`.`follow`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ssafit`.`follow` ;

CREATE TABLE IF NOT EXISTS `ssafit`.`follow` (
  `member_no` INT NOT NULL,
  `follow_no` INT NOT NULL,
  PRIMARY KEY (`follow_no`, `member_no`),
  CONSTRAINT `follow_member_mno_FK`
    FOREIGN KEY (`member_no`)
    REFERENCES `ssafit`.`member` (`member_no`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `follow_member_fno_Fk`
    FOREIGN KEY (`follow_no`)
    REFERENCES `ssafit`.`member` (`member_no`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- -----------------------------------------------------
-- 기본 정보 입력
-- -----------------------------------------------------
-- fit_part
INSERT INTO fit_part (`part_no`, `part_name`)
VALUES(0001, '전신');
INSERT INTO fit_part (`part_no`, `part_name`)
VALUES(0002, '상체');
INSERT INTO fit_part (`part_no`, `part_name`)
VALUES(0003, '하체');
INSERT INTO fit_part (`part_no`, `part_name`)
VALUES(0004, '복부');

-- member 관리자 추가
INSERT INTO `member`(`user_id`,`password`,`nickname`)
VALUES('admin','admin','관리자');

INSERT INTO `member`(`user_id`,`password`,`nickname`)
VALUES('asdf','asdf','무적계정');

-- video
SELECT * FROM video;

INSERT INTO video(`youtube_id`, `fit_part_no`, `title`, `channel_name`, `url`)
VALUES('gMaB-fG4u4g',1,'전신 다이어트 최고의 운동 [칼소폭 찐 핵핵매운맛]','ThankyouBUBU','https://www.youtube.com/embed/gMaB-fG4u4g');
		
INSERT INTO video(`youtube_id`, `fit_part_no`, `title`, `channel_name`, `url`)
VALUES('swRNeYw1JkY',1,'하루 15분! 전신 칼로리 불태우는 다이어트 운동','ThankyouBUBU','https://www.youtube.com/embed/swRNeYw1JkY');

INSERT INTO video(`youtube_id`, `fit_part_no`, `title`, `channel_name`, `url`)
VALUES('54tTYO-vU2E',2,'상체 다이어트 최고의 운동 BEST [팔뚝살/겨드랑이살/등살/가슴어깨라인]','ThankyouBUBU','https://www.youtube.com/embed/54tTYO-vU2E');

INSERT INTO video(`youtube_id`, `fit_part_no`, `title`, `channel_name`, `url`)
VALUES('QqqZH3j_vH0',2,'상체비만 다이어트 최고의 운동 [상체 핵매운맛]','ThankyouBUBU','https://www.youtube.com/embed/QqqZH3j_vH0');

INSERT INTO video(`youtube_id`, `fit_part_no`, `title`, `channel_name`, `url`)
VALUES('tzN6ypk6Sps',3,'하체운동이 중요한 이유? 이것만 보고 따라하자 ! [하체운동 교과서]','김강민','https://www.youtube.com/embed/tzN6ypk6Sps');

INSERT INTO video(`youtube_id`, `fit_part_no`, `title`, `channel_name`, `url`)
VALUES('PjGcOP-TQPE',4,'11자복근 복부 최고의 운동 [복근 핵매운맛]','ThankyouBUBU','https://www.youtube.com/embed/PjGcOP-TQPE');

INSERT INTO video(`youtube_id`, `fit_part_no`, `title`, `channel_name`, `url`)
VALUES('7TLk7pscICk',4,'(Sub)누워서하는 5분 복부운동!! 효과보장! (매일 2주만 해보세요!)','SomiFit','https://www.youtube.com/embed/7TLk7pscICk');

INSERT INTO video(`youtube_id`, `fit_part_no`, `title`, `channel_name`, `url`)
VALUES('u5OgcZdNbMo',3,'저는 하체 식주의자 입니다','GYM종국','https://www.youtube.com/embed/u5OgcZdNbMo');

-- review

INSERT INTO review(`youtube_id`, `title`, `writer_no`, `content`)
VALUES('gMaB-fG4u4g','정말 재미 있어요',1,'동해물과백두산이마르고닳도록하느님이보우하사우리나라만세');

-- zzim
INSERT INTO `zzim`(`member_no`, `youtube_id`)
VALUES
(1, 'u5OgcZdNbMo'),
(1, '7TLk7pscICk'),
(2, 'u5OgcZdNbMo');

-- follow
INSERT INTO `follow`(`member_no`, `follow_no`)
VALUES
(1, 2),
(2, 1);

-- -------