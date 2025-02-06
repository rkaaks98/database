#날짜 : 2025/01/07
#이름 : 김준서
#내용 : 3장 테이블 제약조건
drop table `user2`;
create table `user2`(
		`uid`	varchar(10) primary key,
		`name`	varchar(10),
		`birth`	char(10),
		`addr`	varchar(50)
);
insert into `user2` values ('A101','김유신','1968-05-09','경남 김해시');
insert into `user2` values ('A102','김춘추','1972-11-23','경남 경주시');
insert into `user2` values ('A103','장보고','1978-03-01','전남 완도군');
insert into `user2` values ('A105','강감찬','1979-08-16','서울시 관악구');
insert into `user2` values ('A104','이순신','1981-05-23','부산시 진구');
user1select * from `user2`;
#---------------------------------------------------------------------
create table `user3`(
		`uid`	varchar(10) primary key,
		`name`	varchar(10),
		`birth`	char(10),
        `hp`	char(13) unique,
		`addr`	varchar(50)
);
insert into `user3` values ('A101','김유신','1968-05-09','010-1234-1001','경남 김해시');
insert into `user3` values ('A102','김춘추','1972-11-23','010-1234-1002','경남 경주시');
insert into `user3` values ('A103','장보고','1978-03-01','010-1234-1003','전남 완도군');
insert into `user3` values ('A105','강감찬','1979-08-16','010-1234-1004','서울시 관악구');
insert into `user3` values ('A104','이순신','1981-05-23','010-1234-1005','부산시 진구');
select * from `user3`;

#-------------------------------------------------------------------------
create table `parent`(
		`pid`	varchar(10) primary key,
		`name`	varchar(10),
		`birth`	char(10),
		`addr`	varchar(50)
);
insert into `parent` values ('p101','김유신','1968-05-09','경남 김해시');
insert into `parent` values ('p102','김춘추','1972-11-23','경남 경주시');
insert into `parent` values ('p103','장보고','1978-03-01','전남 완도군');
insert into `parent` values ('p104','강감찬','1979-08-16','서울시 관악구');
insert into `parent` values ('p105','이순신','1981-05-23','부산시 진구');
select * from `parent`;

create table `child`(
		`cid`	varchar(10) primary key,
		`name`	varchar(10),
		`hp`	char(13) unique,
        `parent`varchar(10),
        foreign key(`parent`) references `parent`(`pid`)
);
insert into `child` values ('c101','김철수','010-1234-1001','p101');
insert into `child` values ('c102','김영희','010-1234-1002','p101');
insert into `child` values ('c103','강철수','010-1234-1003','p103');
insert into `child` values ('c104','이철수','010-1234-1004','p105');
select * from `child`;

#------------------------------------------------------------------------
create table `user4`(
		`uid`	varchar(10) primary key,
		`name`	varchar(10) not null,
		`gender`char(1),
        `age`	int default 1,
        `hp`	varchar(13) unique,
        `addr`	varchar(50)
);
insert into `user4` values ('a101','김유신','M',25,'010-1234-1111','경남 김해시');
insert into `user4` values ('a102','김춘추','M',25,'010-1234-2222','경남 경주시');
insert into `user4` values ('a103','장보고','M',25,'010-1234-3333','전남 완도시');
insert into `user4` values ('a104','강감찬','M',25,'010-1234-4444','서울시 관악구');
insert into `user4` (`uid`,`name`,`gender`,`age`,`addr`) values ('a105','신사임당','F',32,'부산시 진구');
select * from `user4`;

#------------------------------------------------------------------------

create table `user5`(
		`seq`	int auto_increment primary key,
		`name`	varchar(10) not null,
		`gender`char(1) check (`gender`in('M','F')),
        `age`	int default 1 check(`age`>0 and `age`<100),
        `addr`	varchar(50)
);
insert into `user5` (`name`,`gender`,`age`,`addr`) values ('김유신','M',25,'경남 김해시');
insert into `user5` (`name`,`gender`,`age`,`addr`) values ('김춘추','M',23,'경남 경주시');
insert into `user5` (`name`,`gender`,`age`,`addr`) values ('장보고','M',35,'전남 완도시');
insert into `user5` (`name`,`gender`,`age`,`addr`) values ('강감찬','M',42,'서울시 관악구');
insert into `user5` (`name`,`gender`,`age`,`addr`) values ('이순신','M',51,'부산시');
insert into `user5` (`name`,`gender`,`age`,`addr`) values ('신사임당','F',25,'강릉시');
select * from `user5`;













