#날짜 : 2025/01/06
#이름 : 김준서
#내용 : 2장 SQL 기초

#실습 2-1
use StudyDB;
CREATE TABLE `User1` (
	`uid`	VARCHAR(10),
    `name`  VARCHAR(10),
    `hp`	CHAR(13),
    `age`	INT
);


DROP TABLE `User1`;
 
 #실습 2-2
 
 insert into `user1` values ('A101','김유신','010-1234-1111',25);
 insert into `user1` values ('A102','김춘추','010-1234-2222',23);
 insert into `user1` values ('A103','장보고','010-1234-3333',32);
 insert into `user1` (`uid`,`name`,`age`) values ('A104','강감찬',45);
 insert into `user1` SET `uid`='A105', `name`='이순신', `hp`='010-1234-5555';

 #실습 2-3
 select * from `user1`;
 select * from `user1` where `uid`='A101';
 select * from `user1` where `name`='김춘추';
 select * from `user1` where `age` < 30;
 select * from `user1` where `age` >= 30;
 select `uid`,`name`,`age` from `User1`;
 

 #실습 2-4
 
 update `User1` set `hp`='010-1234-4444' where `uid`='A104';
 update `user1` set `age`=51 where `uid`='A105';
 update `user1` set `hp`='010-1234-1001', `age`=27 where `uid`='A101';
 #실습 2-5
 
 delete from `user1` where `uid`='A101';
 delete from `user1` where `uid`='A102' and `age`=25;
 delete from `user1` where `age`>=30;
 
 #실습 2-6
 alter table `user1` add `gender` TINYINT;
 alter table `user1` add `birth` char(10) after `name`; 
 alter table `user1` modify `gender` char(1);
 alter table `user1` modify `age` tinyint;
 alter table `user1` drop `gender`;
 
 #실습 2-7
 CREATE TABLE `User1copy` like `user1`;
 insert into `user1copy` select * from `user1`;
 
 
 #실습 2-8
 
 select * from `tb1user`;
 CREATE TABLE `Tb1User` (
	`user_id`	VARCHAR(10),
    `user_name`  VARCHAR(10),
    `user_hp`	CHAR(13),
    `user_age`	INT,
    `user_addr` VARCHAR(10)
);
drop table `tb1user`;

insert into `tb1user` values ('p101','김유신','010-1234-1001',25,'경남 김해시');
insert into `tb1user` values ('p102','김춘추','010-1234-1002',23,'경남 경주시');
insert into `tb1user` (`user_id`,`user_name`,`user_age`,`user_addr`) values ('p103','장보고',31,'전남 완도군');
insert into `tb1user` (`user_id`,`user_name`,`user_addr`) values ('p104','강감찬','서울시 중구');
insert into `tb1user` (`user_id`,`user_name`,`user_hp`,`user_age`) values ('p105','이순신','010-1234-1005',50);
drop table `tb1product`;
select * from `tb1product`;
 CREATE TABLE `Tb1Product` (
	`prod_no`	 INT,
    `prod_name`  VARCHAR(10),
    `prod_price`	INT,
    `prod_stock`	INT,
    `prod_company` VARCHAR(10),
    `prod_date` 	DATE
);

insert into `tb1product` values (1001,'냉장고',800000,25,'LG전자','2022-01-06');
insert into `tb1product` values (1002,'노트북',1200000,120,'삼성전자','2022-01-07');
insert into `tb1product` values (1003,'모니터',350000,35,'LG전자','2023-01-13'); 
insert into `tb1product` values (1004,'세탁기',1000000,80,'삼성전자','2021-01-01'); 
insert into `tb1product` values (1005,'컴퓨터',1500000,20,'삼성전자','2023-10-01'); 
insert into `tb1product` (`prod_no`,`prod_name`,`prod_price`,`prod_stock`) values (1006,'휴대폰',950000,102); 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


