shoppingboard#날짜 : 2025/02/17
#이름 : 김준서
#내용 : 게시판 프로젝트 테이블 설계


-- 데이터베이스 생성
DROP DATABASE IF EXISTS `board2`;
CREATE DATABASE `board2`;
USE `board2`;

-- 사용자 생성 및 권한 부여
DROP USER IF EXISTS 'board2'@'%';
CREATE USER 'board2'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `board2`.* TO 'board2'@'%';
FLUSH PRIVILEGES;

-- User 테이블
CREATE TABLE `User` (
	`uid` 		VARCHAR(20) PRIMARY KEY,
	`pass`		VARCHAR(100),
	`name`		VARCHAR(20),
	`nick`		VARCHAR(20) UNIQUE,
	`email`		VARCHAR(50) UNIQUE,
	`hp`			CHAR(13) 	UNIQUE,
	`role`		VARCHAR(20)	DEFAULT 'USER',
	`zip`			CHAR(5),
	`addr1`		VARCHAR(100),
	`addr2`		VARCHAR(100),
	`regip`		VARCHAR(100),
	`regDate`	DATETIME,
	`leaveDate`	DATETIME
);

-- trems 테이블
CREATE TABLE `Terms` (
	`no`			INT PRIMARY KEY AUTO_INCREMENT,
	`terms`		TEXT,
	`privacy`	TEXT
);

-- article 테이블
CREATE TABLE `Article` (
	`no`			INT AUTO_INCREMENT PRIMARY KEY,
	`cate`		VARCHAR(20) DEFAULT 'free',
	`title`		VARCHAR(100) NOT NULL,
	`content`	TEXT NOT NULL,
	`comment`	INT DEFAULT 0,
	`file`		TINYINT DEFAULT 0,
	`hit`			INT DEFAULT 0,
	`writer`		VARCHAR(20) NOT NULL,
	`regip`		VARCHAR(100) NOT NULL,
	`wdate`		DATETIME,
	FOREIGN KEY (`writer`) REFERENCES `User` (`uid`)
);

-- comment 테이블
CREATE TABLE `Comment` (
	`cno`			INT PRIMARY KEY AUTO_INCREMENT,
	`parent`		INT NOT NULL,
	`content`	TEXT NOT NULL,
	`writer`		VARCHAR(20) NOT NULL,
	`regip`		VARCHAR(100) NOT NULL,
	`wdate`		DATETIME,
	FOREIGN KEY (`writer`) REFERENCES `User` (`uid`),
	FOREIGN KEY (`parent`) REFERENCES `Article` (`no`)
);

-- file 테이블
CREATE TABLE `File` (
	`fno`			INT AUTO_INCREMENT PRIMARY KEY,
	`ano`			INT NOT NULL,
	`oName`		VARCHAR(100) NOT NULL,
	`sName`		VARCHAR(100) NOT NULL,
	`download`	INT DEFAULT 0,
	`rdate`		DATETIME,
	FOREIGN KEY (`ano`) REFERENCES `Article` (`no`)
);


#제목 검색
SELECT
 	a.*,
	u.nick
from article AS a
JOIN `user` AS u ON a.writer = u.uid
WHERE `title` LIKE '%?%';

#내용 검색
SELECT
 	a.*,
	u.nick
from article AS a
JOIN `user` AS u ON a.writer = u.uid
WHERE `content` LIKE '%?%';

#글쓴이 검색
SELECT a.*,u.nick
from article AS a
JOIN `user` AS u ON a.writer = u.uid
WHERE `nick` LIKE '%김준서%'
ORDER BY `no` DESC
LIMIT 0, 10;


SELECT COUNT(*) FROM `article` AS a
JOIN `user` AS u ON a.writer = u.uid
WHERE `title` LIKE '%준서%';

SELECT COUNT(*) FROM `article` AS a
JOIN `user` AS u ON a.writer = u.uid
WHERE `nick` LIKE '%준서%';


SELECT * FROM articles 
WHERE writer LIKE '%김준서%'
ORDER BY article_no DESC
LIMIT 0, 10;



