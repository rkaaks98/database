INSERT INTO customer VALUES('c101','김유신','010-1234-1001','경남 김해시','2023-01-01');
INSERT INTO customer VALUES('c102','김춘추','010-1234-1002','경남 경주시','2023-01-02');
INSERT INTO customer VALUES('c103','장보고','010-1234-1003','전남 완도군','2023-01-03');
INSERT INTO customer VALUES('c104','강감찬','010-1234-1004','서울시 관악구','2023-01-04');
INSERT INTO customer VALUES('c105','이순신','010-1234-1005','부산시 금정구','2023-01-05');

INSERT INTO product VALUES(1,'새우깡','5000','1500','농심');
INSERT INTO product VALUES(2,'초코파이','2500','2500','오리온');
INSERT INTO product VALUES(3,'포카칩','3600'bankerdbank_account,'1700','오리온');
INSERT INTO product VALUES(4,'양파링','1250','1800','농심');
INSERT INTO product(prodNo,prodName,stock,company) VALUES(5,'죠리퐁','2200','크라운');

INSERT INTO `order`(orderId,orderProduct,orderCount,orderDate) VALUES('c102',3,2,'2023-01-01 13:15:10');
INSERT INTO `order`(orderId,orderProduct,orderCount,orderDate) VALUES('c101',4,1,'2023-01-01 13:15:12');
INSERT INTO `order`(orderId,orderProduct,orderCount,orderDate) VALUES('c102',1,1,'2023-01-01 13:15:14');
INSERT INTO `order`(orderId,orderProduct,orderCount,orderDate) VALUES('c103',5,5,'2023-01-01 13:15:16');
INSERT INTO `order`(orderId,orderProduct,orderCount,orderDate) VALUES('c105',2,1,'2023-01-01 13:15:18');

SELECT 
orderNo,
`name`,
prodname,
ordercount,
orderdate
FROM `order` o
JOIN customer c ON o.orderid = c.custid
JOIN product p ON o.orderProduct = p.prodNo;

SELECT 
orderNo,
prodno,
prodname,
price,
ordercount,
orderdate
FROM `order` o
JOIN customer c ON o.orderid = c.custid
JOIN product p ON o.orderProduct = p.prodNo WHERE c.name = '김유신';


SELECT SUM(price * ordercount) FROM product AS p JOIN `order` AS o ON p.prodNo = o.orderProduct; 




INSERT INTO bank_customer VALUES('730423-1000001','김유신',1,'010-1234-1001','경남 김해시');
INSERT INTO bank_customer VALUES('730423-1000002','김춘추',1,'010-1234-1002','경남 경주시');
INSERT INTO bank_customer VALUES('730423-1000003','장보고',1,'010-1234-1003','전남 완도군');
INSERT INTO bank_customer VALUES('102-12-51094','(주)정보산업',2,'051-500-1004','부산시 부산진구');
INSERT INTO bank_customer VALUES('930423-1000005','이순신',1,'010-1234-1005','서울 종로구');

INSERT INTO bank_account VALUES('101-11-1001','S1','자유저축예금','730423-1000001',1550000,'2011-04-11');
INSERT INTO bank_account VALUES('101-11-1002','S1','자유저축예금','930423-1000005',260000,'2011-05-12');
INSERT INTO bank_account VALUES('101-11-1003','S1','자유저축예금','750423-1000003',75000,'2011-06-13');
INSERT INTO bank_account VALUES('101-12-1001','S2','기업전용예금','102-12-51094',15000000,'2011-07-14');
INSERT INTO bank_account VALUES('101-13-1001','S3','자유저축예금','730423-1000002',1200000,'2011-08-15');

INSERT INTO bank_transaction(t_a_no,t_dist,t_amount,t_datetime) VALUES('101-11-1001',1,50000,'2023-01-01 13:15:10');
INSERT INTO bank_transaction(t_a_no,t_dist,t_amount,t_datetime) VALUES('101-12-1001',2,50000,'2023-01-02 13:15:12');
INSERT INTO bank_transaction(t_a_no,t_dist,t_amount,t_datetime) VALUES('101-11-1001',3,50000,'2023-01-03 13:15:14');
INSERT INTO bank_transaction(t_a_no,t_dist,t_amount,t_datetime) VALUES('101-11-1001',2,50000,'2023-01-04 13:15:16');
INSERT INTO bank_transaction(t_a_no,t_dist,t_amount,t_datetime) VALUES('101-11-1001',3,50000,'2023-01-05 13:15:18');
INSERT INTO bank_transaction(t_a_no,t_dist,t_amount,t_datetime) VALUES('101-11-1001',1,50000,'2023-01-05 13:15:28');

SELECT 
,
,
,
,

FROM bank_customer c
JOIN bank_account a ON c.c_no = a.a_c_no;











INSERT INTO student VALUES('20201011','김유신','010-1234-1001',3,'경남 김해시');
INSERT INTO student VALUES('20201122','김춘추','010-1234-1002',3,'경남 경주시');
INSERT INTO student VALUES('20210213','장보고','010-1234-1003',2,'전남 완도군');
INSERT INTO student VALUES('20210324','강감찬','010-1234-1004',2,'서울 관악구');
INSERT INTO student VALUES('20220415','이순신','010-1234-1005',1,'서울 종로구');

INSERT INTO lecture VALUES(101,'컴퓨터과학 개론',2,40,'본301');
INSERT INTO lecture VALUES(102,'프로그래밍 언어',3,52,'본302');
INSERT INTO lecture VALUES(103,'데이터베이스',3,56,'본303');
INSERT INTO lecture VALUES(104,'자료구조',3,60,'본304');
INSERT INTO lecture VALUES(105,'운영체제',3,52,'본305');

INSERT INTO register(regStdNo,regLecNo,regMidScore,regFinalScore) VALUES('20220415',101,60,30);
INSERT INTO register(regStdNo,regLecNo,regMidScore,regFinalScore) VALUES('20210324',103,54,36);
INSERT INTO register(regStdNo,regLecNo,regMidScore,regFinalScore) VALUES('20201011',105,52,28);
INSERT INTO register(regStdNo,regLecNo,regMidScore,regFinalScore) VALUES('20220415',102,38,40);
INSERT INTO register(regStdNo,regLecNo,regMidScore,regFinalScore) VALUES('20210324',104,56,32);
INSERT INTO register(regStdNo,regLecNo,regMidScore,regFinalScore) VALUES('20210213',103,48,40);
