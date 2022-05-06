SELECT * FROM world.country;
-- 대륙이 'Africa' 가 아닌 다른 대륙의 속하는 국가의 정보를 표시해보세요.
SELECT * FROM country WHERE Continent != 'Africa';
SELECT * FROM country WHERE NOT Continent = 'Africa';
SELECT * FROM country WHERE Continent <> 'Africa';
-- 대륙의 이름과 인구수를 인구수 내림차순으로 표시해보세요.
SELECT name, population FROM country ORDER BY Population DESC;
-- 대륙의 이름과 인구수를 인구수 내림차순으로 표시해보세요. 
-- 동일인구수가 나온다면 GNP오름차순으로 또 정렬하여 표시해보세요.
SELECT name, population,GNP FROM country ORDER BY Population DESC, GNP;

USE review;
DESC emp;
-- emp테이블에 값을 저장해보세요.
INSERT INTO emp (empno, ename, hiredate, deptno, sal)
VALUES (11, 'Koon', '1991-03-29', 11, 3400);
SELECT * FROM emp;

-- emp테이블에 간단하게 데이터를 저장해보세요.
INSERT INTO emp VALUES (12, 'Harim', '1990-07-27', 12, 5300);
SELECT * FROM emp;

-- empno가 12번인 사원의 deptno를 10으로 변경해보세요.
UPDATE emp SET deptno = 10 WHERE empno = 12;
SELECT * FROM emp;

-- emp테이블에 여러개의 데이터값을 한번에 저장하세요.
INSERT INTO emp VALUES
	(13, 'Jin', '2020-09-23', 13, 2300),
	(14, 'King', '2021-04-24', 14, 3200),
	(15, 'Scott', '2022-12-23', 15, 3300);
SELECT * FROM emp;

-- emp테이블에 2개의 데이터만 저장하세요.
INSERT INTO emp(empno, ename) VALUES(16, 'Suzan');
SELECT * FROM emp;

-- emp테이블의 empno가 16번인 사원의 데이터를 삭제해보세요.
DELETE FROM emp WHERE empno = 16;
SELECT * FROM emp;

-- emp테이블에 사번 16, 이름 손흥민, 급여 5000를 저장해 보세요.
INSERT INTO emp(empno, ename, sal) VALUES (16, '손흥민', 5000);

-- emp테이블에서 deptno가 null값인 데이터들을 표시해보세요.
SELECT * FROM emp WHERE deptno IS NULL;
    
-- emp테이블에서 deptno가 null이 아닌값인 데이터들을 표시해보세요.
SELECT * FROM emp WHERE deptno IS NOT NULL;

-- emp테이블에서 empno가 16번인 사원에게 deptno 10번을 저장해주세요.
UPDATE emp SET deptno = 10 WHERE empno = 16;

-- emp테이블의 데이터들을 deptno순으로 정렬해보세요.
SELECT * FROM emp ORDER BY deptno;
SELECT * FROM emp ORDER BY deptno DESC;

-- emp테이블 데이터들의 급여액 TOP3를 출력해보세요.
SELECT * FROM emp ORDER BY sal DESC LIMIT 3;

-- emp테이블 데이터들의 급여액 TOP2와 TOP3의 정보를 출력해보세요.
SELECT * FROM emp ORDER BY sal DESC LIMIT 1,2;
