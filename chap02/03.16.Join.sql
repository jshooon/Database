-- 도시 중에서 인구가 가장 적은 도시의 이름과 인구수를 표시해보세요.
USE world;

SELECT name, Population 
FROM city 
WHERE Population = (SELECT MIN(Population) FROM city);

SELECT MIN(population) FROM city;

-- 인구수가 가장 적은 도시의 이름과 인구수, 국가코드를 표시해보세요.

SELECT name, population, countryCode
FROM city
WHERE Population = (SELECT MIN(population) FROM city);
         
-- city 테이블에는 국가코드(PCN)만 있고 국가명은 없다.
-- 국가명은 country 테이블에 저장되어 있음. 
-- SQL문장 하나의 문장에서 2개의 테이블을 다룰 필요가 있을 때 JOIN을 사용한다.

-- 최소의 인구를 가진 도시명과 그 도시의 국가명을 동시에 표시하려면?
SELECT name, population FROM city
WHERE population = (SELECT MIN(population) FROM city);

-- 잘못된 예시.
SELECT name, name, population
FROM city INNER JOIN country -- 연결하는 테이블 지정 후 조건을 넣는다.
ON city.countrycode = country.code; -- ON을 쓰고 조건을 사용하여 테이블을 붙인다.

-- 옳은 예시.
SELECT cn.name, ct.name, ct.Population, cn.continent
FROM city AS ct INNER JOIN country AS cn -- 연결하는 테이블 지정 후 조건을 넣는다.
ON ct.countrycode = cn.code -- 연결 조건.city의 국가코드와 country의 국가코드와 같다라는 조건. 
WHERE ct.Population = 
    (SELECT MIN(population)		-- form절 뒤에 별칭을 지정하고, 변경해준다.
        FROM city);

-- 최소의 인구를 가진 도시명과 그 도시의 국가명, 대륙명을 동시에 표시하려면?
SELECT ct.name, cn.name, ct.Population, cn. continent
FROM city AS ct INNER JOIN country AS cn -- 연결하는 테이블 지정 후 조건을 넣는다.
ON ct.countrycode = cn.code -- 연결 조건.city의 국가코드와 country의 국가코드와 같다라는 조건. 
WHERE ct.Population = 
    (SELECT MIN(population)		-- form절 뒤에 별칭을 지정하고, 변경해준다.
        FROM city);

-- 국토의 면적이 가장 넓은 국가의 이름과 면적의 크기를 표시해보세요.

SELECT country.name, country.surfacearea
FROM country
WHERE surfacearea=(SELECT MAX(surfacearea) FROM country);


USE mydb;
DESC emp;

-- AVG() : 평균함수, 사용법 : ex) AVG(population) 인구수의 평균
-- SUM() : 합계, 사용법 : ex) SUM(sal) 급여의 총합
-- 행조건이 없지만 다 가져오지않고 명령한 대로의 통계를 한행으로 가져온다.
-- 그룹전체를 검색하여 계산해오는것을 그룹함수라 한다. 그룹함수는 한행만 가져온다.

SELECT * FROM(emp);

-- 사원급여 평균액, 급여총액을 구해보세요.
SELECT AVG(sal) 평균급여 , SUM(sal) 급여총액 FROM emp;

-- 잘못된 예시. 전체행을 가져오라했지만 그룹함수에 의하여 한행만 가져온다.
SELECT ename, sal, AVG(sal) 평균급여 , SUM(sal) 급여총액 FROM emp;

-- 평균보다 높은 급여를 받는 사원의 모든 정보를 표시해보세요.
SELECT * FROM emp WHERE sal > (SELECT AVG(sal) FROM emp);

-- JOIN : INNER JOIN, OUTER JOIN, PULL JOIN, CROSS JOIN
-- OUTER JOIN : LEFT OUTER JOIN, RIGHT OUTER JOIN
-- INNER JOIN 연결조건에 맞는것만 데이터를 가져온다.
-- OUTER JOIN 연결조건에 맞지않아도 데이터를 선택하여 가져온다. 그 중 왼쪽 오른쪽 지정한다.
-- 두개의 데이터 테이블이 매칭이 되지않아도 왼쪽의 한행을 가져오는 경우에 OUTER JOIN : LEFT OUTER JOIN
-- 두개의 데이터 테이블이 매칭이 되지않아도 오른쪽의 한행을 가져오는 경우에 OUTER JOIN : RIGHT OUTER JOIN
-- FULL OUTER JOIN 연결조건에 맞지않아도 두개의 데이터를 가져온다. 그 중 왼쪽 오른쪽 지정한다.
-- CROSS : JOIN 모든행끼리 무조건 연결하여 데이터를 가져온다.

-- table1에 col1 컬럼생성, 각행에 a,b,c,d 입력.
-- table2에 col1 컬럼생성, 각행에 1,2,3,4 입력.
-- 위의 테이블 2개를 COSSS JOIN 하면?
DESC table1;
DESC table2;
SELECT * FROM table1, table2;
-- 위의 테이블들을 table1을 기준으로 오름차순으로 정렬하세요.
SELECT * FROM table1 t1, table2 t2
ORDER BY t1.col1;

-- table2의 레코드를 1만 남기고 모두 삭제하기.
DELETE FROM table2 WHERE col1 <> 1;
SELECT * FROM table2;

-- 한 행만 가진 table2와 table1을 CROSS JOIN 하면?
SELECT * FROM table1 CROSS JOIN table2;
SELECT * FROM table1, table2; -- ,를 사용한다면 따로 CROSS JOIN 효과를 볼 수 있다.


-- 평균 급여액보다 더 많이 급여를 받는 사원들의 정보와 평균 급여액을 표시해보세요.
-- 사원명, 급여액, 전체평균급여
SELECT empno, sal, (SELECT AVG(sal)FROM emp) "평균급여" FROM emp WHERE sal > (SELECT AVG(sal) FROM emp);

SELECT * FROM emp CROSS JOIN (SELECT AVG(sal) AS "전체평균급여" FROM emp)t1 
WHERE sal > (SELECT AVG(sal) FROM emp);

-- ROUND : 반올림 이다. 소수점을 반올림하여 정수로 표시한다.d
-- 괄호안에 있는것이 먼저 돌아간다.d
-- 별칭을 주며 더욱 간단명료하게 변경 할 수 있다.
-- t1은 가상의 테이블이라고도 하며 inline view라고 한다.d
-- 먼저돌아가는 sql별칭은 외부에서 사용할 수 있다.d
-- t1 테이블이 먼저 돌아가고 t1 안에 avg존재가 먼저 생기기 때문에 밖에서 참조가능.d
-- emp테이블에는 avg란 컬럼이 없기 때문에 t1.을 사용하지않아도 된다.

-- 평균 급여액보다 더 많이 급여를 받는 사원들의 정보와 평균 급여액을 표시해보세요.
-- 사원명, 급여액, 전체평균급여를 sql 언어를 간단명료하게 표시하세요.
SELECT ename "사원명", sal "급여액", t1.avg "평균급여액" 
FROM emp, (SELECT ROUND(AVG(sal)) AS "avg" FROM emp) t1
WHERE sal > t1.avg;

DESCRIBE emp;
SELECT deptno FROM emp;

CREATE TABLE dept (
	deptno INT NOT NULL, -- 다른 DB에서는 컬럼레벨에 프라이머리키에 붙일 수 있다.
	dname VARCHAR(20) NOT NULL,
    loc VARCHAR(20),
    PRIMARY KEY(deptno)
);
DESC dept;

CREATE TABLE userss (
	uid VARCHAR(10) NOT NULL,
    pwd VARCHAR(10) NOT NULL,
    name VARCHAR(10),
    phone VARCHAR(20),
    PRIMARY KEY(uid)
    );
INSERT INTO userss
	VALUES ('koon', 'koonpwd', 'koon', '010-2546-8789'),
			('harim', 'harimpwd', 'harim', '010-3584-5549'),
            ('seokgu', 'seokgupwd', 'seokgu', '010-5515-8155'),
            ('jin', 'jinpwd', 'jin', '010-3581-5845'),
            ('paul', 'paulpwd', 'paul', '010-2358-3548');
create database mydb;
show databases;
-- 10번 부서는 '총무과', 위치는 '대전'
-- 20번 부서는 '개발팀', 위치는 '강릉'
-- 30번 부서는 '생산과', 위치는 '광주'
-- 40번 부서는 '연구실', 위치는 '인천'
-- 50번 부서는 '인사과', 위치는 '서울'

-- INSERT INTO dept 
-- VALUES 
-- (10, '총무과', '대전'),
-- (20, '개발팀', '강릉'),
-- (30, '생산과', '광주'),
-- (40, '연구실', '인천'),
-- (50, '인사과', '서울');

SELECT * FROM dept;
SELECT * FROM emp;

-- 'King' 이라는 사원을 emp 테이블에 입력(17,'King', '2000-01-01', null, 7000)하세요.
INSERT INTO emp VALUES (17,'King', '2000-01-01', null, 7000);

-- 각 사원의 이름과 부서명, 급여액을 표시해보세요.
SELECT e.ename, d.dname, e.sal 
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno;

-- OUTER JOIN을 사용하여 조건이 맞지않는 (부서번호가 없는) 사원도 출력할 수 있다.
-- 조건이 맞지않는 사원도 표시해보세요.
SELECT e.ename, d.dname, e.sal 
FROM emp e LEFT OUTER JOIN dept d
ON e.deptno = d.deptno;

-- 테이블간의 관계(Relation), RDBMS(관계형 데이터베이스 관리 시스템)

-- 테이블 생성시에 FK 설정
-- 테이블 생성 후 FK 설정 가능.

-- CREATE TABLE emp (
-- 	empno,
--     ename,
--     deptno,
--     hiredate,
--     sal,
--     FOREIGN KEY(deptno) REFERENCES dept(dempno) emp의 deptno가 dept의 deptno를 참조한다는 키값을 준다는 뜻.
-- );

-- FK를 설정할 테이블이 이미 생성된 후에 FK 설정하기.
-- ALTER를 사용하여 테이블을 지정해주고  ADD CONSTRAINT 제약조건의 이름을 지정
-- FOREIGN KEY(deptno) REFERENCES dept(deptno); 제약조건의 내용을 지정한다.

ALTER TABLE emp
ADD CONSTRAINT FK_deptno -- 제약조건의 이름은 FK_deptno
FOREIGN KEY(deptno) REFERENCES dept(deptno); -- 제약조건의 내용은 FOREIGN KEY(deptno) REFERENCES dept(deptno);

INSERT INTO emp VALUES(20, 'xxx', '2000-10-10',100, 0);

-- FK 삭제방법
ALTER TABLE emp
DROP FOREIGN KEY FK_deptno;

-- 부모 테이블에서 자식 테이블이 참조하고 있는 외부키 컬럼을 변경한다면?
-- dept 테이블의 deptno 컬럼 값 중에서 10 -> 15로 변경한다면?
-- 자식은 부모를 잃게 된다. 무결성이 깨진다.
-- CASCADE 단계적으로.
-- 따라서 ON DELETE CASCADE ON UPDATE CASCADE를 사용하여
-- 부모 데이터 값이 변경되면 자식 데이터 값도 변경되고 삭제도 동일하게 제약조건을 걸어준다.

ALTER TABLE emp
ADD CONSTRAINT FK_deptno 
FOREIGN KEY(deptno) REFERENCES dept(deptno)
ON DELETE CASCADE ON UPDATE CASCADE; -- 단계적으로 부모 자식간의 데이터값이 같이 변경되게 설정하는 조건

UPDATE dept SET deptno = 10 WHERE deptno = 15;

SELECT * FROM dept;
SELECT * FROM emp;

-- 집합연산
-- 동일한 컬럼과 테이블일 때, TABLE을 합칠수 있다. 합치는 키워드는 UNION.
-- UNION ALL 좌우는 WIDE 상하는 LONG.
SELECT * FROM emp WHERE deptno IN(15, 20)
UNION 
SELECT * FROM emp WHERE deptno IN(30, 40)
UNION
SELECT * FROM emp WHERE deptno IS NULL
ORDER BY empno;

-- emp 테이블에서 모든 행을 가져오는 2개의 SELECT 문장을 UNION ALL 으로 합치면 ?
-- 결과 값은 두번 가져온 결과 값을 가져온다.
SELECT * FROM emp
UNION ALL
SELECT * FROM emp;

-- emp 테이블에서 모든 행을 가져오는 2개의 SELECT 문장을 UNION 으로 합치면 ?
-- 결과 값은 DISTINCT키워드가 적용된 것처럼 중복된 데이터는 표시하지 않는다.
SELECT * FROM emp
UNION
SELECT * FROM emp;

-- 각 부서별로 인원수를 보고하세요. 부서별 = GROUP BY
SELECT deptno, COUNT(*) AS cnt
FROM emp
GROUP BY deptno
ORDER BY cnt DESC, deptno DESC;

-- 그룹에 대한 조건은 HAVING을 사용한다. 컬럼은 WHERE 이듯.
-- 그룹조건을 적용하여 deptno값이 null인 사람을 제외 해보세요.
SELECT deptno, COUNT(*) AS cnt
FROM emp
GROUP BY deptno
HAVING deptno IS NOT NULL
ORDER BY cnt DESC;

