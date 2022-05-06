USE world;
SELECT * FROM city;
-- 인구수가 100만 이상인 도시명과 인구수를 표시해보세요.
SELECT name, Population FROM city WHERE Population >= 1000000;
-- 한국 도시명과 국가코드를 표시해보세요.
SELECT name, CountryCode FROM city WHERE CountryCode = 'KOR';
-- 서울의 인구수를 표시해보세요.
SELECT name, Population FROM city WHERE name = 'Seoul';
-- 국가코드만 표시해보세요.
SELECT CountryCode FROM city;
-- 중복되지 않도록 국가코드 표시.
SELECT DISTINCT CountryCode From city;
-- 한국의 도시수를 표시하려면?
SELECT count(name) FROM city WHERE CountryCode = 'KOR';
-- 국가의 수를 표시하려면?
SELECT count(DISTINCT CountryCode) "국가 수" FROM city;
-- 위의 문장을 하위질의(Sub-Query) 형식으로 표현해보면?
SELECT count(*) "Count Of Nations" FROM(
SELECT DISTINCT countryCode FROM city
) t1;
-- ID가 100인 도시의 모든 정보를 표시해보세요.
SELECT * FROM city WHERE ID = 100;
-- ID가 10~20 구간에 위치한 도시의 모든 정보를 표시해보세요.
SELECT * FROM city WHERE ID >= 10 AND ID <= 20;
-- BETWEEN 연산자로 위의 문장을 표현해보면?
SELECT * FROM city WHERE ID BETWEEN 10 AND 20;
-- ID가 10, 20, 22, 30, 45에 해당하는 도시의 모든 정보를 표시해보세요.
SELECT * FROM city WHERE ID IN(10, 20, 22, 30, 45);
-- district 컬럼의 값 중에 'Noord'으로 시작되는 값이 포함된 도시정보 표시해보세요. 패턴검색법
SELECT * FROM city WHERE District LIKE 'Noord%';
-- 도시명이 'K'로 시작되는 도시정보를 표시.
SELECT * FROM city WHERE Name LIKE 'K%';
-- 도시명이 'K'로 시작되는 도시의 수를 표시하세요.
SELECT count(*) FROM city WHERE name LIKE 'K%';
-- 한개의문자의 두번 째 철자가 a인 도시명을 표시하세요.
SELECT name FROM city WHERE name LIKE '_a%';
-- 도시명의 2번 째 철자가 'a'인  행을 찾아 검색된 행 수를 표시할 때 Sub-Query사용하기.
SELECT count(*) FROM(
SELECT name FROM city WHERE name LIKE '_a%'
) t2;
-- 국가코드가 AFG 이거나 NLD에 속하는 도시들의 정보를 표시하세요.
SELECT CountryCode FROM city WHERE CountryCode = 'AFG' OR CountryCode = 'NLD';

SELECT * FROM city;