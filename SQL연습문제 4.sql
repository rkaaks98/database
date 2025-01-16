#날짜 : 2025/01/16
#이름 : 김준서
#내용 : SQL 연습문제 4




#실습 4-1
create database `Theater`;
create user 'theater'@'%' identified by '1234';
grant all privileges on theater. * to 'theater'@'%';
flush privileges;

#실습 4-2
create table `Movies` (
	`movie_id` 		int primary key auto_increment,
    `title` 		varchar(30) not null,
    `genre` 		varchar(10) not null,
    `release_date` 	date not null
);

create table `Customers` (
	`customer_id` 	int primary key auto_increment,
    `name` 			varchar(20) not null,
    `email` 		varchar(50) not null,
    `phone` 		char(13) not null
);
drop table `customers`;

create table `Bookings` (
	`booking_id` 	int primary key,
    `customer_id` 	int not null,
    `movie_id` 		int not null,
    `num_tickets` 	int not null,
    `booking_date`	datetime not null
);

#실습 4-3
insert into `movies` (`title`,`genre`,`release_date`) values('쇼생크의 탈출','드라마','1994-10-14');
insert into `movies` (`title`,`genre`,`release_date`) values('타이타닉','로맨스','1997-03-24');
insert into `movies` (`title`,`genre`,`release_date`) values('탑건','액션','1987-07-16');
insert into `movies` (`title`,`genre`,`release_date`) values('쥬라기공원','액션','1994-02-11');
insert into `movies` (`title`,`genre`,`release_date`) values('글래디에이터','액션','2000-05-03');
insert into `movies` (`title`,`genre`,`release_date`) values('시네마천국','드라마','1995-04-12');
insert into `movies` (`title`,`genre`,`release_date`) values('미션임파서블','액션','1995-11-11');
insert into `movies` (`title`,`genre`,`release_date`) values('노트북','로맨스','2003-08-23');
insert into `movies` (`title`,`genre`,`release_date`) values('인터스텔라','SF','2011-05-26');
insert into `movies` (`title`,`genre`,`release_date`) values('아바타','SF','2010-02-10');

insert into `customers` (`name`,`email`,`phone`) values('김유신','kys@example.com','010-1234-1001');
insert into `customers` (`name`,`email`,`phone`) values('김춘추','kcc@example.com','010-1234-1002');
insert into `customers` (`name`,`email`,`phone`) values('장보고','jbg@example.com','010-1234-1003');
insert into `customers` (`name`,`email`,`phone`) values('강감찬','kgc@example.com','010-1234-1004');
insert into `customers` (`name`,`email`,`phone`) values('이순신','lss@example.com','010-1234-1005');

insert into `bookings` values (101,1,1,2,'2023-01-10 00:00:00');
insert into `bookings` values (102,2,2,3,'2023-01-11 00:00:00');
insert into `bookings` values (103,3,2,2,'2023-01-13 00:00:00');
insert into `bookings` values (104,4,3,1,'2023-01-17 00:00:00');
insert into `bookings` values (105,5,5,2,'2023-01-21 00:00:00');
insert into `bookings` values (106,3,8,2,'2023-01-21 00:00:00');
insert into `bookings` values (107,1,10,4,'2023-01-21 00:00:00');
insert into `bookings` values (108,2,9,1,'2023-01-22 00:00:00');
insert into `bookings` values (109,5,7,2,'2023-01-23 00:00:00');
insert into `bookings` values (110,3,4,2,'2023-01-23 00:00:00');
insert into `bookings` values (111,1,6,1,'2023-01-24 00:00:00');
insert into `bookings` values (112,3,5,3,'2023-01-25 00:00:00');

#실습 4-4
select title from `movies`;

#실습 4-5
select * from movies where `genre` = '로맨스';

#실습 4-6
select `title`,`release_date`
from `movies` where `release_date` >= '2010-01-01';

#실습 4-7
SELECT
	`booking_id`, `booking_date`
FROM `Bookings` 
WHERE `num_tickets` >= 3;

#실습 4-8
select * from `bookings` where `booking_date` < '2023-01-20';

#실습 4-9
select * from `movies` where `release_date` between '1990-01-01' and '1999-12-31';

#실습 4-10
select * from `bookings`
order by `booking_date` desc limit 3;


#실습 4-11
select 
	`title`,`release_date` 
from `movies`
order by `release_date` asc limit 1;

#실습 4-12
select concat(`title`, ' - ', `release_date`) as `movie_info` from `movies`
where `genre` = '액션' and `title` like '%공원%'
order by release_date asc limit 1;

#실습 4-13
select `booking_date`,`title`
from `bookings`
join `movies`
on `bookings`.movie_id = `movies`.movie_id
where `customer_id` = 2;

select `booking_date`,`title`
from `bookings`
join `movies`
using (movie_id)
where `customer_id` = 2;

#실습 4-14
select
	`name`,
    `phone`,
    `booking_date`,
    `title`
FROM bookings B
JOIN Customers C ON B.customer_id = C.customer_id
JOIN Movies M ON B.movie_id = M.movie_id;

#실습 4-15
select 
	`genre`,
    avg(b.num_tickets) as `avg_tickets`
from `bookings` b
join `movies` m on b.movie_id = m.movie_id
group by m.genre;

#실습 4-16
select 
	c.name,
    avg(b.num_tickets) as `avg_tickets`
from `bookings` b
join `customers` c on b.customer_id = c.customer_id
group by `name`;

select 
	c.name,
    avg(b.num_tickets) as `avg_tickets`
from `bookings` b
join `customers` c on b.customer_id = c.customer_id
group by c.customer_id;

#실습 4-17
select
	c.name,
    sum(b.num_tickets) as `전체 예매 티켓 수`
from `bookings` b
join `customers` c on b.customer_id = c.customer_id
group by `name`
order by `전체 예매 티켓 수` desc;

#실습 4-18
select 
	`booking_id`,
    `movie_id`,
    `name`,
    `booking_date`
from `bookings` b
join `customers` c on b.customer_id = c.customer_id
order by b.booking_date asc
limit 1;

#실습 4-19
select 
	`genre`,`title`,`release_date`
from `movies`
where (genre, release_date) in (
select genre, max(release_date)
from `movies`
group by `genre`
);

#실습 4-20
SELECT * FROM `Movies`
WHERE `movie_id` IN (
SELECT `movie_id` FROM `Bookings`
WHERE `customer_id` = (SELECT customer_id FROM `Customers` where name = '김유신')
);

#실습 4-21
SELECT name, email FROM Customers
WHERE customer_id = (
SELECT customer_id
FROM Bookings
GROUP BY customer_id
ORDER BY SUM(num_tickets) DESC limit 1
);

#실습 4-22
select * from `bookings`
where `num_tickets` > (select avg(num_tickets) from `bookings`);

#실습 4-23
select 
	m.title,sum(b.num_tickets) as `total_tickets`
from `bookings` b 
join `movies` m on b.movie_id = m.movie_id
group by `title`;

#실습 4-24
SELECT
	`name`,
	SUM(b.num_tickets) AS total_tickets,
	AVG(b.num_tickets) AS avg_tickets
FROM `Bookings` b
JOIN `Customers` c ON b.customer_id = c.customer_id
group by `name`;

#실습 4-25
SELECT
	c.customer_id,
	c.name,
	c.email,
SUM(b.num_tickets) AS `예매 티켓수`
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
group by `customer_id`
order by `예매 티켓수` desc;

#실습 4-26
SELECT
	`name`,
    `title`,
    b.num_tickets,
    `booking_date`
FROM `bookings` b
JOIN `customers` c ON b.customer_id = c.customer_id
JOIN `movies` m ON b.movie_id = m.movie_id
ORDER BY `num_tickets` DESC;


#실습 4-27
SELECT
	M.title,
	M.genre,
	SUM(B.num_tickets) AS `예매 티켓 수`,
	AVG(B.num_tickets) AS `평균 티켓 수`
FROM bookings B
JOIN Movies M ON B.movie_id = M.movie_id
WHERE M.genre = '액션'
group by m.`movie_id`
ORDER BY `평균 티켓 수` DESC;

#실습 4-28
select
	b.customer_id,
    c.name,
    sum(`num_tickets`) as `ticket_total`
from `bookings` b
join `customers` c on b.customer_id = c.customer_id
group by `customer_id`
order by `ticket_total` desc;

#실습 4-29
SELECT
	B.booking_id,
	B.customer_id,
	B.movie_id,
	MaxTickets.max_tickets
FROM `Bookings` B
JOIN (
SELECT movie_id, MAX(num_tickets) AS max_tickets
FROM Bookings
group by `movie_id`
) AS MaxTickets
ON B.movie_id = MaxTickets.movie_id AND B.num_tickets = MaxTickets.max_tickets;

#실습 4-30
select
	b.booking_id,
    b.customer_id,
    c.name,
    m.title,
    m.genre,
    sum(b.num_tickets) as `예매 티켓 수`
from `bookings` b
join `movies` m on b.movie_id = m.movie_id
join `customers` c on b.customer_id = c.customer_id
group by m.title
having `예매 티켓 수` = (
select max(total_tickets)
from (
		select sum(b2.num_tickets) as `total_tickets`
        from `bookings` b2
        join `movies` m2 on b2.movie_id = m2.movie_id
        where m2.genre = m.genre
        group by m2.title
        )as selectMAX
)
order by `예매 티켓 수` desc;

select @@sql_mode;
set session sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


        







