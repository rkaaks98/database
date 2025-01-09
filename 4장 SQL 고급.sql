#날짜 : 2025/01/08
#이름 : 김준서
#내용 : 4장 SQL 고급

create table `member`(
	`uid` 	varchar(10) primary key,
    `name` 	varchar(10) not null,
    `hp` 	varchar(13) unique not null,
    `pos`	varchar(10) default '사원',
    `dep` 	int,
    `rdate` datetime not null
);
select * from `member`;

create table `department` (
	`depno` int primary key,
    `name` 	varchar(10) not null,
    `tel` 	varchar(12) not null
);
select * from `department`;

create table `sales`(
	`seq` 	int primary key auto_increment,
    `uid` 	varchar(10) not null,
	`year`	year not null,
	`month`	int not null,
	`sale`	int
);
select * from `sales`;
drop table `sales`;


insert into `member` values ('a101','박혁거세','010-1234-1001','부장',101,now());
insert into `member` values ('a102','김유신','010-1234-1002','차장',101,now());
insert into `member` values ('a103','김춘추','010-1234-1003','사원',101,now());
insert into `member` values ('a104','장보고','010-1234-1004','대리',102,now());
insert into `member` values ('a105','강감찬','010-1234-1005','과장',102,now());
insert into `member` values ('a106','이성계','010-1234-1006','차장',103,now());
insert into `member` values ('a107','정철','010-1234-1007','차장',103,now());
insert into `member` values ('a108','이순신','010-1234-1008','부장',104,now());
insert into `member` values ('a109','허균','010-1234-1009','부장',104,now());
insert into `member` values ('a110','정약용','010-1234-1010','사원',105,now());
insert into `member` values ('a111','박지원','010-1234-1011','사원',105,now());
select * from `member`;


insert into `department` values (101,'영업1부','051-512-1001');
insert into `department` values (102,'영업2부','051-512-1002');
insert into `department` values (103,'영업3부','051-512-1003');
insert into `department` values (104,'영업4부','051-512-1004');
insert into `department` values (105,'영업5부','051-512-1005');
insert into `department` values (106,'영업지원부','051-512-1006');
insert into `department` values (107,'인사부','051-512-1007');
select * from `department`;


insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a101',2018,1,98100);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a102',2018,1,136000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a103',2018,1,80100);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a104',2018,1,78000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a105',2018,1,93000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a101',2018,2,23500);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a102',2018,2,126000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a103',2018,2,18500);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a105',2018,2,19000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a106',2018,2,53000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a101',2019,1,24000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a102',2019,1,109000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a103',2019,1,101000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a104',2019,1,53500);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a107',2019,1,24000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a102',2019,2,160000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a103',2019,2,101000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a104',2019,2,43000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a105',2019,2,24000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a106',2019,2,109000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a102',2020,1,201000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a104',2020,1,63000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a105',2020,1,74000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a106',2020,1,122000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a107',2020,1,111000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a102',2020,2,120000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a103',2020,2,93000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a104',2020,2,84000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a105',2020,2,180000);
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a108',2020,2,76000);
select * from `sales`;

select
	sum(`sale`) as `합계` 
    from 	`sales`
    where 	`year` = '2018' and
			`month` = 1;
            
select
	sum(`sale`) as `총합`,
    avg(`sale`) as `평균`
from 
	`sales`
where
	`year` = 2019 and
	`month` = 2 and
    `sale` >= 50000;
    
select
	min(`sale`) as `최저`,
    max(`sale`) as `최고`
from 
	`sales`
where
	`year` = 2020;



#실습 4-10
select @@sql_mode;

set session sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';



select * from `sales` group by `uid`;
select * from `sales` group by `year`;
select * from `sales` group by `uid`,`year`;
select `uid`, COUNT(*) as `건수` from `sales` group by `uid`;
select `uid`, SUM(`sale`) as `합계` from `sales` group by `uid`;


#실습 4-11
select 
	`uid`, SUM(`sale`) as `합계`
from
	`sales`
group by
	`uid`
having
	`합계` >= 200000;
select `uid`, AVG(`sale`) as `평균` from `sales` group by `uid`;

select 
	`uid`,`year`, sum(`sale`) as `합계`
from
	`sales`
group by
	`uid`, `year`;
    
    
select 
	`uid`,`year`, sum(`sale`) as `합계`
from
	`sales`
where 
	`sale` >= 50000
group by
	`uid`, `year`
order by `year` asc, `합계` desc;


select 
	`uid`,`year`, sum(`sale`) as `합계`
from
	`sales`
where 
	`sale` >= 50000
group by
	`uid`, `year`
order by `합계` desc;

#실습 4-12
create table `sales2` like `sales`;
insert into `sales2` select * from `sales`;
update `sales2` set `year` = `year` + 3;
select * from `sales2`;

select * from `sales`
union
select * from `sales2`;

select * from 
	`sales`
where
	`sale` >= 100000
union
	select * from `sales2`
where
	`sale` >= 100000;
    
select
	`uid`,`year`,`sale`
from
	`sales`
union
select
	`uid`,`year`,`sale`
from
	`sales2`;
    
select `uid`,`year`,sum(sale) as `합계`
from `sales`
group by `uid`,`year`
union
select `uid`,`year`,sum(sale) as `합계`
from `sales2`
group by `uid`,`year`
order by `year` asc, `합계` desc;    

#실습 4-13
select * from `sales` inner join `member` on `sales`.`uid` = `member`.`uid`;

select 
	* 
from `member` as a
join `department` as b
on a.dep = b.depno;

select 
	*
from `sales` as a
join `member` as b using(`uid`);


select
	*
from `sales` as a
join `member` as b on a.uid = b.uid
join `department` as c on b.dep = c.depno;


#실습 4-14
insert into `sales` (`uid`,`year`,`month`,`sale`) values ('a201',2020,2,15500);

select 
	* 
from `sales` as a 
right join `member` as b on a.uid = b.uid;

select a.`seq`,a.`uid`,`sale`,`name`,`pos` from `sales` as a
join `member` as b on a.`uid` = b.`uid`
where `sale` >= 100000;

select * from `member`;

select * from `sales` as a
join `member` as b on a.uid = b.uid
join `department` as c on b.dep = c.depno;

select a.seq, a.uid, `sale`, `name`, `pos` from sales as a
inner join member as b using(uid);

select * from `sales` as a, `member` as b
where a.uid = b.uid;

#4-15 모든직원
select
	`uid`,a.`name`, `pos`,b.`name` 
from `member` as a
join `department` as b 
on a.dep = b.depno;

#4-16
select 
	sum(`sale`) as `김유신 2019년 매출 합` 
from `sales` as a
join `member` as b on a.uid = b.uid
where 
	`name` = '김유신' and
    `year` = 2019;
    
#4-17
select 
	b.`name`,
    c.`name`,
    b.`pos`,
    a.`year`,
	sum(`sale`) as `매출합`
from `sales` as a
join `member` as b on a.uid = b.uid
join `department` as c on b.dep = c.depno
where `year` = 2019 and `sale` >= 50000
group by a.`uid`
having `매출합` >= 100000
order by `매출합` desc;










