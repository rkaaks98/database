#날짜 : 2025/01/17
#이름 : 김준서
#내용 : SQL 연습문제 5






#실습 5-1
create database Bookstore;
create user 'bookstore'@'%' identified by '1234';
grant all privileges on bookstore.* to 'bookstore'@'%';
flush privileges;

#실습 5-2
create table Customer (
	custId 	int primary key auto_increment,
    name 	varchar(10),
    address varchar(20) default null,
    phone 	varchar(13) default null
);
 drop table customer;
 
 create table Book (
	bookId 		int primary key,
    bookname 	varchar(20),
    publisher 	varchar(20),
    price 		int default null
);
drop table book;
    
create table `Order` (
	orderId 	int primary key auto_increment,
    custId 		int,
    bookId 		int,
    salePrice 	int,
    orderDate 	date
    );
    
#실습 5-3
insert into Customer (name,address,phone) values ('박지성','영국 맨체스타','000-5000-0001');
insert into Customer (name,address,phone) values ('김연아','대한민국 서울','000-6000-0001');
insert into Customer (name,address,phone) values ('장미란','대한민국 강원도','000-7000-0001');
insert into Customer (name,address,phone) values ('추신수','미국 클리블랜드','000-8000-0001');
insert into Customer (name,address) values ('박세리','대한민국 대전');

insert into Book values(1,'축구의 역사','굿스포츠',7000);
insert into Book values(2,'축구아는 여자','나무수',13000);
insert into Book values(3,'축구의 이해','대한미디어',22000);
insert into Book values(4,'골프 바이블','대한미디어',35000);
insert into Book values(5,'피겨 교본','굿스포츠',8000);
insert into Book values(6,'역도 단계별기술','굿스포츠',6000);
insert into Book values(7,'야구의 추억','이상미디어',20000);
insert into Book values(8,'야구를 부탁해','이상미디어',13000);
insert into Book values(9,'올림픽 이야기','삼성당',7500);
insert into Book values(10,'Olympic Champions','Pearson',13000);

insert into `Order` (custid,bookid,saleprice,orderdate) values(1,1,6000,'2014-07-01');
insert into `Order` (custid,bookid,saleprice,orderdate) values(1,3,21000,'2014-07-03');
insert into `Order` (custid,bookid,saleprice,orderdate) values(2,5,8000,'2014-07-03');
insert into `Order` (custid,bookid,saleprice,orderdate) values(3,6,6000,'2014-07-04');
insert into `Order` (custid,bookid,saleprice,orderdate) values(4,7,20000,'2014-07-05');
insert into `Order` (custid,bookid,saleprice,orderdate) values(1,2,12000,'2014-07-07');
insert into `Order` (custid,bookid,saleprice,orderdate) values(4,8,13000,'2014-07-07');
insert into `Order` (custid,bookid,saleprice,orderdate) values(3,10,12000,'2014-07-08');
insert into `Order` (custid,bookid,saleprice,orderdate) values(2,10,7000,'2014-07-09');
insert into `Order` (custid,bookid,saleprice,orderdate) values(3,8,13000,'2014-07-10');

#실습 5-4
select * from customer;

#실습 5-5
select * from book;

#실습 5-6
select price,bookname from book;

#실습 5-7
select bookid,bookname,publisher,price from book;

#실습 5-8
select publisher from book;

#실습 5-9
select distinct publisher from book;

select publisher from book group by publisher;

#실습 5-10
select * from book where price >= 20000;

#실습 5-11
select * from book where price < 20000;

#실습 5-12
select * from book where price between 10000 and 20000;

#실습 5-13
select bookid,bookname,price from book where price between 15000 and 30000;

#실습 5-14
select * from book where bookid in (2,3,5);

select * from book where bookid =2 or bookid = 3 or bookid = 5;

#실습 5-15
select * from book where bookid % 2 = 0;

select * from book where mod(bookid,2) = 0;

#실습 5-16
select * from customer where name like '박%';

#실습 5-17
select * from customer where address like '대한민국%';

#실습 5-18
select * from customer where phone is not null;

#실습 5-19
select * from book where publisher in ('굿스포츠','대한미디어');

select * from book where publisher ='굿스포츠' or publisher = '대한미디어';

#실습 5-20
select publisher from book where bookname='축구의 역사';

#실습 5-21
select publisher from book where bookname like'축구%';

#실습 5-22
select * from book where bookname like'_구%';

#실습 5-23
select * from book where bookname like'%축구%' and price >= 20000;

#실습 5-24
select * from book order by bookname asc;

#실습 5-25
select * from book order by price asc, bookname asc;

#실습 5-26
select * from book order by price desc, publisher asc;

#실습 5-27
select * from book order by price desc limit 3;

#실습 5-28
select * from book order by price asc limit 3;

#실습 5-29
select sum(salePrice) 총판매액 from `order`;

#실습 5-30
select 
	sum(salePrice) 총판매액,
    avg(salePrice) 평균값,
    min(salePrice) 최저가,
    max(salePrice) 최고가
from `order`;

#실습 5-31
select count(*) 판매건수 from `order`;

#실습 5-32
select 
	bookid,
	replace(bookname, '야구','농구') as bookname,
    publisher,
    price
from book;


#실습 5-33
select custId,count(*) 수량 from `order` 
where salePrice >= 8000
group by custid
having 수량 >= 2;

#실습 5-34
select * from customer c
join `order` o on c.custid = o.custid;

#실습 5-35
select * from customer c
join `order` o on c.custid = o.custid
order by c.custId asc;

#실습 5-36
select c.name,o.salePrice from customer c
join `order` o on c.custid = o.custid
order by c.custId;

#실습 5-37
select c.name,sum(o.salePrice) 
from customer c
join `order` o on c.custid = o.custid
group by c.custId;

#실습 5-38
select c.name,b.bookname from customer c
join `order` o on c.custId = o.custId
join book b on o.bookId = b.bookId;

#실습 5-39
select c.name,b.bookname from customer c
join `order` o on c.custId = o.custId
join book b on o.bookId = b.bookId
where saleprice = 20000;

#실습 5-40
select c.name,o.salePrice from customer c
left join `order` o on c.custId = o.custId
left join book b on o.bookId = b.bookId;

#실습 5-41
select sum(salePrice) 총매출 from customer c
join `order` o on c.custId = o.custId
join book b on o.bookId = b.bookId
where `name` ='김연아' ;

#실습 5-42
select bookname from book
order by price desc limit 1;

select bookname from book
where price = (select max(price) from book);

#실습 5-43
select name from customer c
left join `order` o on c.custId = o.custId
where orderid is null;

#실습 5-44
insert into book (bookid,bookname,publisher) values (11,'스포츠의학','한솔의학서적');
select * from book;

insert into book set
					bookid = 11,
                    booname = '스포츠의학',
                    publisher = '한솔의학서적',
                    price = null;

#실습 5-45
update customer set address = '대한민국 부산'
where custid = 5;
select * from customer;

#실습 5-46
delete from customer
where custid = 5;

select * from customer;
















