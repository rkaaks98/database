#날짜 : 2025/01/15
#이름 : 김준서
#내용 : SQL 연습문제 3

#실습 3-1
create database `College`;
create user 'college'@'%' identified by '1234';
grant all privileges on `college`.* to 'college'@'%';
flush privileges;

#실습 3-2
create table `Student` (
	`stdNo`		char(8) primary key,
	`stdName`	varchar(20) not null,
	`stdHp`		char(13) unique not null,
	`stdYear` 	int not null,
	`stdAddress`varchar(100) default null
);
drop table `student`;

create table `Lecture` (
	`lecNo`		int primary key,
	`lecName`	varchar(20) not null,
	`lecCredit`	int not null,
	`lecTime` 	int not null,
	`lecClass`	varchar(10) default null
);
drop table `lecture`;

create table `Register` (
	`regStdNo`		char(8) not null,
	`regLecNo`		int not null,
	`regMidScore`	int ,
	`regFinalScore` int ,
	`regTotalScore`	int ,
    `regGrade`		char(1)
);
drop table `register`;


#실습 3-3
insert into `student` (`stdno`,`stdname`,`stdhp`,`stdyear`) values('20201016','김유신','010-1234-1001',3);
insert into `student` values('20201126','김춘추','010-1234-1002',3,'경상남도 경주시');
insert into `student` values('20210216','장보고','010-1234-1003',2,'전라남도 완도시');
insert into `student` values('20210326','강감찬','010-1234-1004',2,'서울시 영등포구');
insert into `student` values('20220416','이순신','010-1234-1005',1,'부산시 부산진구');
insert into `student` values('20220521','송상현','010-1234-1006',1,'부산시 동래구');

insert into `lecture` values(159,'인지행동심리학',3,40,'본304');
insert into `lecture` values(167,'운영체제론',3,25,'본B05');
insert into `lecture` values(234,'중급영문법',3,20,'본201');
insert into `lecture` values(239,'세법개론',3,40,'본204');
insert into `lecture` values(248,'빅데이터개론',3,20,'본B01');
insert into `lecture` values(253,'컴퓨팅사고와 코딩',2,10,'본B02');
insert into `lecture` values(349,'사회복지 마케팅',2,50,'본301');

insert into `register` (`regstdno`,`reglecno`) values('20201126',234);
insert into `register` (`regstdno`,`reglecno`) values('20201016',248);
insert into `register` (`regstdno`,`reglecno`) values('20201016',253);
insert into `register` (`regstdno`,`reglecno`) values('20201126',239);
insert into `register` (`regstdno`,`reglecno`) values('20210216',349);
insert into `register` (`regstdno`,`reglecno`) values('20210326',349);
insert into `register` (`regstdno`,`reglecno`) values('20201016',167);
insert into `register` (`regstdno`,`reglecno`) values('20220416',349);


#실습 3-4
select * from `lecture`;

#실습 3-5
select * from `student`;

#실습 3-6
select * from `register`;

#실습 3-7
select * from `student` where `stdyear` = 3;

#실습 3-8
select * from `lecture` where `leccredit` = 2;

#실습 3-9
update `register` set `regmidscore` = 36, `regfinalscore` = 42 where
`regstdno` = '20201126' and `reglecno` = 234;
update `register` set `regmidscore` = 24, `regfinalscore` = 62 where
`regstdno` = '20201016' and `reglecno` = 248;
update `register` set `regmidscore` = 28, `regfinalscore` = 40 where
`regstdno` = '20201016' and `reglecno` = 253;
update `register` set `regmidscore` = 37, `regfinalscore` = 57 where
`regstdno` = '20201126' and `reglecno` = 239;
update `register` set `regmidscore` = 28, `regfinalscore` = 68 where
`regstdno` = '20210216' and `reglecno` = 349;
update `register` set `regmidscore` = 16, `regfinalscore` = 65 where
`regstdno` = '20210326' and `reglecno` = 349;
update `register` set `regmidscore` = 18, `regfinalscore` = 38 where
`regstdno` = '20201016' and `reglecno` = 167;
update `register` set `regmidscore` = 25, `regfinalscore` = 58 where
`regstdno` = '20220416' and `reglecno` = 349;
select * from `register`;

#실습 3-10
update `register` set
					`regTotalScore`= `regMidScore` + `regFinalScore`,
					`regGrade` = 	if(`regTotalScore` >= 90, 'A',
									if(`regTotalScore` >= 80, 'B',
									if(`regTotalScore` >= 70, 'C',
									if(`regTotalScore` >= 60, 'D', 'F'))));
select * from `register`;

#실습 3-11
select * from `register` order by `regtotalscore`desc;

#실습 3-12
select * from `register` where `reglecno` = 349 order by `regTotalScore` desc;

#실습 3-13
select * from `lecture` where `lecTime` >= 30;

#실습 3-14
select `lecname`,`lecclass` from `lecture`;

#실습 3-15
select `stdno`,`stdname` from `student`;

#실습 3-16
select * from `student` where `stdAddress` is null;

#실습 3-17
select * from `student` where `stdAddress` like '부산시%';

#실습 3-18
select * from `student` as a
left join `register` as b on a.stdNo = b.regStdNo;

#실습 3-19
select
	`stdNo`,
    `stdName`,
    `regLecNo`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `student` as a, `register` as b where a.stdno = b.regstdno; 

#실습 3-20
SELECT `stdName`, `stdNo`, `regLecNo`
FROM `Student` AS a
JOIN `Register` AS b on a.stdno = b.regstdno where `reglecno` = 349;


#실습 3-21
SELECT
`stdNo`,
`stdName`,
COUNT(`stdNo`) AS `수강신청 건수`,
SUM(`regTotalScore`) AS `종합점수`,
SUM(`regTotalScore`) / COUNT(`stdNo`) AS `평균`
FROM `Student` AS a
JOIN `Register` AS b
ON a.stdNo = b.regStdNo
group by `stdno`
order by `stdno`;

#실습 3-22
select * from `register` as a
join `lecture` as b on a.regLecNo = b.lecNo;

#실습 3-23
SELECT
	`regStdNo`,
	`regLecNo`,
	`lecName`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
from `register` as a
join `lecture` as b on a.regLecNo = b.lecNo;

#실습 3-24
SELECT
COUNT(*) AS `사회복지 마케팅 수강 신청건수`,
AVG(`regTotalScore`) AS `사회복지 마케팅 평균`
FROM `Register` AS a JOIN `Lecture` AS b ON a.regLecNo = b.lecNo
where `lecname` = '사회복지 마케팅';

#실습 3-25
SELECT
	`regStdNo`,
	`lecName`
FROM `Register` AS a JOIN `Lecture` AS b ON a.regLecNo = b.lecNo
where `reggrade` = 'A';

#실습 3-26
select * from `student` as a
join `register` as b on a.stdNo = b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo;

#실습 3-27
SELECT
	`stdNo`,
	`stdName`,
	`lecNo`,
	`lecName`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
FROM `Student` AS a
join `register` as b on a.stdNo = b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo
order by `regTotalScore` desc;

#실습 3-28
SELECT
	`stdNo`,
	`stdName`,
	`lecName`,
	`regTotalScore`,
	`regGrade`
FROM `Student` AS a
join `register` as b on a.stdno = b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo
where `regGrade` = 'F';


#실습 3-29
SELECT
	`stdNo`,
	`stdName`,
	SUM(`lecCredit`) AS `이수학점`
FROM `Student` AS a
join `register` as b on a.stdno = b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo
where `regGrade` <'F'
group by `stdno`,`stdname`;

#실습 3-30
SELECT
	`stdNo`,
	`stdName`,
	GROUP_CONCAT(`lecName`) AS `신청과목`,
	GROUP_CONCAT(if(`regTotalScore` >= 60, `lecName`, null)) AS `이수과목`
FROM `Student` AS a
join `register` as b on a.stdno = b.regStdNo
join `lecture` as c on b.regLecNo = c.lecNo
group by `stdno`;