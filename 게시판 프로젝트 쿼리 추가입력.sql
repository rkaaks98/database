INSERT INTO `article` (`title`, `content`, `writer`, `regip`, `wdate`)
SELECT `title`, `content`, `writer`, `regip`, `wdate` FROM `article`;


SELECT
a.*,
u.`nick` 
FROM `article` AS a
JOIN `user` AS u
ON a.writer = u.uid
ORDER BY `no` DESC
LIMIT 0, 10;

SELECT COUNT(*) FROM `article`;