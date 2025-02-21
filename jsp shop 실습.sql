studydbstudydbstudydbuser2SELECT 
	o.ORDERno,
	p.prodname,
	o.ordercount,
	p.company,
	c.`name`,
	c.hp,
	o.orderdate
FROM `order` AS o
JOIN `product` AS p ON o.orderproduct = p.prodno
JOIN `customer` AS c ON o.ORDERID = c.custid;