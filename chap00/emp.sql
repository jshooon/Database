USE mydb;

CREATE TABLE emp(
	empno INT NOT NULL,
	ename VARCHAR(10) NOT NULL,
	hiredate VARCHAR(15),
	deptno INT,
	sal INT,
    PRIMARY KEY(empno) -- 다른 DB에서는 컬럼레벨에 프라이머리키에 붙일 수 있다.
);

-- empno, ename, hiredate, deptno, sal을 한행 입력한다.
INSERT INTO emp (empno, ename, hiredate, deptno, sal) -- emp를 생성한다.
VALUES (11,'smith', '2011-05-14', 20, 3400); -- 생성된 emp에 값을 넣어준다.

-- 여러개의 데이터를 값을 줄때
INSERT INTO emp 
VALUES(13, 'Blake', '2021-08-02', 30, 2500),
		(14, 'Ward', '2020-02-23', 10, 2800),
		(15, 'Scott', '2009-12-21', 20, 2900);
        
INSERT INTO emp (empno, ename) VALUES(16, 'Suzan');

-- 데이터 삭제.
DELETE FROM emp WHERE empno = 16;

INSERT INTO emp (empno, ename, sal) VALUES(16, '손흥민', 5000);