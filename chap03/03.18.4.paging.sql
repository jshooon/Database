-- Pagination
-- 한 화면에 3개씩 2페이지 가져오기.
-- 1 -> 0,  :  (1-1) * 3 = 0 
-- 2 -> 3,  :  (2-1) * 3 = 3
-- 3 -> 6,  :  (3-1) * 3 = 6
-- 4 -> 9,  :  (4-1) * 3 = 9
-- 이용자가 정한 페이지 -1 한다음 * 페이지에 표시할 게시글 개수
SELECT * FROM emp LIMIT 3, 3;

SELECT * FROM emp;
SELECT * FROM emp JOIN (SELECT COUNT(*) AS cnt FROM emp) t;

SELECT * 
FROM emp JOIN (SELECT COUNT(*) AS cnt FROM emp) t 
LIMIT 0, 3;



SELECT * FROM
(SELECT * FROM emp LIMIT 0, 3) t1 
CROSS JOIN
(SELECT COUNT(*) FROM emp) t2;


