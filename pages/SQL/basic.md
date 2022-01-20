# SQL 기초

## 기본

- SQL은 대소문자를 가리지 않음.
- SQL에서 세미콜론(;)은 각 구문을 구분하는 역할을 함.

## SELECT

- 데이터베이스에서 데이터를 선택할 때 쓰임.
- 데이터베이스는 result-set을 반환함.

```sql
SELECT column1, column2, ...
FROM table_name;
```

- 테이블에서 찾고 싶은 필드명을 입력하면 해당 필드의 데이터를 받을 수 있음.
- 만약 테이블에 있는 모든 필드를 원한다면 \*을 사용.
- 여러 필드를 찾을 때는 쉼표(,)로 필드명을 구분함.

```sql
SELECT * FROM table_name;
```

## SELECT DISTINCT

- `SELECT`와는 다르게 중복되는 값을 제외한 데이터를 반환받음.

```SQL
SELECT DISTINCT column1, column2, ...
FROM table_name;
```

- `COUNT()`를 사용해 고유값의 개수를 셀 수 있음.

```SQL
SELECT COUNT(DISTINCT column) FROM table_name;
```

## WHERE

- 특정 조건을 만족하는 레코드를 필터링할 수 있다.

```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

- 값을 비교할 때 텍스트는 작은 따옴표로 감싸고, 숫자는 그대로 쓴다.

```sql
SELECT column1 FROM table_name WHERE Country = 'USA';
```

```sql
SELECT column1 FROM table_name WHERE Price > 10;
```

- 조건에 쓰이는 비교 연산자는 다음과 같음.

  - `=`, `>`, `<`, `>=`, `<=`
  - `<>`: 같지 않음
  - `BETWEEN a AND b`: a와 b 사이(a, b를 포함한)
  - `LIKE pattern`: 패턴과의 일치 여부
  - `IN (a, b, c)`: a, b, c 안에 들어있는지의 여부

- 각 조건들은 논리 연산자로 묶을 수 있음(AND, OR, NOT).

```sql
SELECT column1 FROM table_name WHERE Country = 'USA' AND Price < 10;
```

## ORDER BY

특정 컬럼을 기준으로 오름차순/내림차순 정렬이 된 결과를 받을 수 있음(아무 옵션도 주지 않았을 때는 오름차순이 기본값으로 동작).

```sql
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;
```

## INSERT INTO

테이블 안에 새로운 레코드를 삽입. 모든 컬럼을 채우거나 특정 컬럼을 지정하여 그 부분만 삽입할 수 있음.

```sql
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
```

```sql
INSERT INTO table_name
VALUES (value1, value2, value3, ...);
```

## IS NULL, IS NOT NULL

어떤 필드에 값을 넣지 않고 레코드를 만들 수 있을 때, 값을 넣지 않은 필드에는 `NULL` 값이 들어가게 된다(0 혹은 공백 값과는 다름).

특정 컬럼이 NULL이 아닌 레코드만 보고 싶다면

```sql
SELECT column_names
FROM table_name
WHERE column_name IS NOT NULL;
```

특정 컬럼이 NULL인 레코드만 보고 싶다면

```sql
SELECT column_names
FROM table_name
WHERE column_name IS NULL;
```

## UPDATE

테이블의 데이터를 수정하는 명령어.

```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```

`SET` 뒤에 값을 바꿀 컬럼과 값을 세팅한다.

**주의: `WHERE`로 조건을 잘못 설정하면 의도하지 않은 레코드에 변화가 반영될 수 있음. WHERE 구문을 생략하면 테이블의 레코드 전체가 변경 대상이 됨.**

## DELETE

조건에 해당하는 레코드를 테이블에서 지운다.

```sql
DELETE FROM table_name WHERE condition;
```

**주의: UPDATE와 마찬가지로, WHERE 구문을 생략하면 레코드 전체가 삭제됨. 이때 테이블 구조는 유지된다.**

## SELECT TOP, LIMIT, FETCH FIRST, ROWNUM

검색 조건에 맞는 레코드의 반환 최대값을 정함. 데이터베이스 시스템마다 키워드가 조금씩 다르다.

### SQL Server / MS Access Syntax

```sql
SELECT TOP number|percent column_name(s)
FROM table_name
WHERE condition;
```

예시: Customers 테이블에서 ID 오름차순으로 상위 3개 레코드를 반환.

```sql
SELECT TOP 3 * FROM Customers ORDER BY CustomerID;
```

### MySQL Syntax

```sql
SELECT column_name(s)
FROM table_name
LIMIT number;
```

위와 같은 예시를 MySQL에서 사용하면:

```sql
SELECT * FROM Customers ORDER BY CustomerID LIMIT 3;
```

### Oracle 12

```sql
SELECT column_name(s)
FROM table_name
ORDER BY column_name(s)
FETCH FIRST number ROWS ONLY;
```

```sql
SELECT * FROM Customers ORDER BY CustomerID FETCH FIRST 3 ROWS ONLY;
```

## MIN(), MAX()

테이블의 특정 컬럼에서 최소값 혹은 최대값을 반환하는 함수.

```sql
SELECT MIN(column_name)
FROM table_name
WHERE condition;
```

```sql
SELECT MAX(column_name)
FROM table_name
WHERE condition;
```

## SUM(), AVG(), COUNT()

차례대로 테이블의 특정 컬럼의 합, 평균, 개수를 반환(NULL 값은 모두 무시됨).

```sql
SELECT COUNT(column_name)
FROM table_name
WHERE condition;
```

```sql
SELECT AVG(column_name)
FROM table_name
WHERE condition;
```

```sql
SELECT SUM(column_name)
FROM table_name
WHERE condition;
```

## LIKE

WHERE과 함께 사용하며, 패턴으로 특정 컬럼을 검색할 수 있다.

```sql
SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;
```

### 와일드카드

패턴에 사용할 수 있는 기호.

- `_` : 한 문자가 임의로 들어갈 수 있다.
- `%` : 무한한 길이의 문자가 들어갈 수 있다.
- `[abc]` : 대괄호 안애 있는 문자 중 하나가 해당 자리에 들어갈 수 있다.
  - `[^abc]` : 대괄호 안에 있는 문자 중 어떤 것도 해당 자리에 들어갈 수 없다.
  - `[a-c]` : a부터 c까지의 범위 중 한 문자가 해당 자리에 들어갈 수 있다(여기서는 a, b, c 세 문자가 해당됨).

'a'로 시작하는 국가의 고객만 반환하기:

```sql
SELECT * FROM Customers WHERE Country LIKE 'a%';
```

나라 이름의 두 번째 글자가 a 혹은 b인 고객만 반환하기:

```sql
SELECT * FROM Customers WHERE Country LIKE '_[ab]%';
```

### MS Access 와일드카드

- `?` : `_`와 동일.
- `*` : `%`와 동일.
- `[abc]` : `[]`와 동일.
  - `[!abc]` : `[^abc]`와 동일.
  - `[a-c]` : `[a-c]`와 동일.

## IN

WHERE 구문을 쓸 때 여러값을 묶어 OR 연산자로 이어진 것 같이 기능하는 연산자.

```sql
SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...);
```

이것은 아래와 똑같은 기능을 함.

```sql
SELECT column_name(s)
FROM table_name
WHERE column_name = value1
OR column_name = value2
OR ...
```

## BETWEEN

`BETWEEN A AND B` 형식으로 사용한다. 숫자 뿐만 아니라 문자열 값에도 사용 가능하다(오름차순 정렬을 가정했을 때).

```sql
SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;
```

A와 B 사이에 있는 값을 제외하고 싶을 때는 `NOT` 연산자를 붙이면 된다.

```sql
SELECT column_name(s)
FROM table_name
WHERE column_name NOT BETWEEN value1 AND value2;
```

## AS

컬럼이나 테이블의 '별명'을 붙인다. 해당 별명으로 컬럼이나 테이블에 접근할 수 있다. 별명은 현재 쿼리 안에서만 유효하다.

```sql
SELECT column_name AS alias_name
FROM table_name;
```

```sql
SELECT column_name(s)
FROM table_name AS alias_name;
```

여러 컬럼의 값을 조합한 결과에 별명을 붙일 수도 있다.

```sql
SELECT column_name1 + ': ' + column_name2 AS NewValue FROM tab
le_name;
```

**MySQL에서는 CONCAT 함수를 써야 한다.**

```sql
SELECT CONCAT(column_name1, ': ', column_name2) AS NewValue FROM tab
le_name;
```

여러 테이블에서 각각 컬럼을 가져올 때, 테이블 이름이 긴 경우 별명으로 간단하게 컬럼에 접근할 수 있다.

```sql
SELECT v.column1, s.column2
FROM very_long_table_name AS v,
super_long_table_name AS s;
```

## JOIN

### INNER JOIN

테이블 두 개의 공통분모에 해당하는 컬럼만을 반환한다(두 테이블의 교집합 영역).

```sql
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;
```

테이블 1, 2가 다음과 같다고 가정하면,

table1:

| ID  | name |
| :-: | :--: |
|  1  | Choi |
|  2  | Kim  |
|  3  | Lee  |

table2:

| ID  | Country |
| :-: | :-----: |
|  1  |  Korea  |
|  3  |   USA   |
|  4  |  Japan  |

JOIN의 결과는 아래와 같다.

| ID  | name | ID  | Country |
| :-: | :--: | :-: | :-----: |
|  1  | Choi |  1  |  Korea  |
|  3  | Lee  |  3  |   USA   |

### LEFT JOIN

table1의 컬럼 모두와 주어진 기준에서 table1과 겹치는 table2의 컬럼을 반환함(table1의 영역).

```sql
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;
```

table1:

| ID  | name |
| :-: | :--: |
|  1  | Choi |
|  2  | Kim  |
|  3  | Lee  |

table2:

| ID  | Country |
| :-: | :-----: |
|  1  |  Korea  |
|  3  |   USA   |
|  4  |  Japan  |

JOIN의 결과는 아래와 같다.

| ID  | name |  ID  | Country |
| :-: | :--: | :--: | :-----: |
|  1  | Choi |  1   |  Korea  |
|  2  | Kim  | NULL |  NULL   |
|  3  | Lee  |  3   |   USA   |

## RIGHT JOIN

table2의 컬럼 모두와 주어진 기준에서 table2과 겹치는 table1의 컬럼을 반환함(table2의 영역).

```sql
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;
```

table1:

| ID  | name |
| :-: | :--: |
|  1  | Choi |
|  2  | Kim  |
|  3  | Lee  |

table2:

| ID  | Country |
| :-: | :-----: |
|  1  |  Korea  |
|  3  |   USA   |
|  4  |  Japan  |

JOIN의 결과는 아래와 같다.

|  ID  | name | ID  | Country |
| :--: | :--: | :-: | :-----: |
|  1   | Choi |  1  |  Korea  |
|  3   | Lee  |  3  |   USA   |
| NULL | NULL |  4  |  Japan  |

## FULL JOIN

table1과 table2의 기준이 되는 모든 컬럼을 반환함(table1과 table2의 합집합).

```sql
SELECT column_name(s)
FROM table1
FULL JOIN table2
ON table1.column_name = table2.column_name;
```

table1:

| ID  | name |
| :-: | :--: |
|  1  | Choi |
|  2  | Kim  |
|  3  | Lee  |

table2:

| ID  | Country |
| :-: | :-----: |
|  1  |  Korea  |
|  3  |   USA   |
|  4  |  Japan  |

JOIN의 결과는 아래와 같다.

|  ID  | name |  ID  | Country |
| :--: | :--: | :--: | :-----: |
|  1   | Choi |  1   |  Korea  |
|  2   | Kim  | NULL |  NULL   |
|  3   | Lee  |  3   |   USA   |
| NULL | NULL |  4   |  Japan  |

## Self Join

SELF라는 별도의 키워드가 있는 것은 아님. 하나의 테이블에 두 개의 별명을 부여하여 마치 두 테이블을 다루는 것처럼 사용하는 방식.

```sql
SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;
```

예: 고객 이름을 도시 별로 모아 받는 쿼리를 Self Join으로 구현하면

```sql
SELECT A.CustomerName, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City;
```

## UNION

두 SELECT 구문의 반환값을 중복값을 제외하고 합쳐준다.

```sql
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;
```

**두 SELECT 문이 가져오는 컬럼의 개수가 동일해야 함.**

### UNION ALL

UNION과는 다르게 중복값을 제거하지 않고 데이터를 합쳐줌

## GROUP BY

같은 값을 가진 컬럼을 하나로 묶어 요약된 정보를 보고자 할 때 사용함. 주로 COUNT, AVG 같은 함수와 같이 사용함.

```sql
SELECT column_name(s)
FROM table_name
GROUP BY column_name(s)
```

예를 들어 다음과 같은 테이블이 있을 때,

| SellerID | OrderID |
| :------: | :-----: |
|    1     |  33423  |
|    2     |  23234  |
|    1     |  32343  |
|    3     |  34234  |
|    2     |  34342  |

판매자별로 몇 개의 주문을 받았는지 GROUP을 사용하여 확인할 수 있다.

```sql
SELECT SellerID, COUNT(OrderID) AS NumberOfOrder
FROM Sellers
GROUP BY SellerID;
```

| SellerID | NumberOfOrder |
| :------: | :-----------: |
|    1     |       2       |
|    2     |       2       |
|    3     |       1       |

## HAVING

GROUP 절에서 조건을 설정할 때 함수를 사용할 수 있는 절.

```sql
SELECT column_name(s)
FROM table_name
GROUP BY column_name(s)
HAVING condition
```

위의 예시에서 주문 수가 2 이상이 되는 판매자만 볼 수 있다.

```sql
SELECT SellerID, COUNT(OrderID) AS NumberOfOrder
FROM Sellers
GROUP BY SellerID
HAVING COUNT(OrderID) >= 2;
```

| SellerID | NumberOfOrder |
| :------: | :-----------: |
|    1     |       2       |
|    2     |       2       |

## EXISTS

WHERE 절 뒤에 이어서 사용한다. 다른 쿼리의 반환값의 존재 여부를 조건으로 사용할 수 있다.

```sql
SELECT column_name(s)
FROM table_name
WHERE EXISTS
(SELECT column_name FROM table_name WHERE condition);
```

## ALL, ANY

하나의 컬럼을 여러 값들과 비교할 때 쓰는 연산자.

### ANY

현재 컬럼의 값이 비교 대상이 되는 값들 중 하나라도 매치되면 참으로 판단함.

```sql
SELECT column_name(s)
FROM table_name
WHERE column_name operator ANY
  (SELECT column_name
  FROM table_name
  WHERE condition);
```

위의 예시에서 서브쿼리가 반환하는 여러 값들 중 하나라도 column_name과 매치되면 참으로 간주된다.

### ALL

현재 컬럼의 값이 비교 대상이 되는 값들 모두와 매치되어야 참으로 판단함.

```sql
SELECT column_name(s)
FROM table_name
WHERE column_name operator ALL
  (SELECT column_name
  FROM table_name
  WHERE condition);
```

서브 쿼리가 반환하는 모든 값과 컬럼이 매치되어야 참으로 판단한다.

## SELECT INTO

기존 테이블의 전체 혹은 부분을 새로운 테이블로 저장한다. 만약 새로운 테이블을 다른 데이터베이스에 저장하고 싶다면, IN 절을 사용한다.

```sql
SELECT *
INTO newtable [IN externaldb]
FROM oldtable
WHERE condition;
```

기존 테이블에서 아무런 값도 가져오지 않고 테이블 구조만 복사하고 싶을 때는, WEHRE절에 언제나 거짓인 조건을 달면 된다.

```sql
SELECT *
INIT new_tanle
FROM old_table
WHERE 1 = 2;
```

## INSERT INTO SELECT

한 테이블의 데이터를 복사해 다른 테이블에 붙여넣는다. 원본 데이터는 영향을 받지 않는다.

```sql
INSERT INTO table2
SELECT * FROM table1
WHERE condition;
```

컬럼을 지정하여 복사할 때는 아래와 같이 한다.

```sql
INSERT INTO table2 (column1, column2, column3, ...)
SELECT column1, column2, column3, ...
FROM table1
WHERE condition;
```

A 테이블의 데이터를 B 테이블에 복사할 때 빈 컬럼은 NULL로 채워진다.

## CASE

마치 if-else 문처럼 각 조건에 해당하는 반환값을 설정할 수 있다.

```sql
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;
```

NULL이 포함되어 있는 컬럼을 정렬의 기준으로 삼을 때, NULL인 부분만 다른 컬럼을 기준으로 정렬하게 할 수 있음.

```sql
SELECT * FROM table_name
ORDER BY
  CASE
    WHEN column1 IS NULL THEN column2
    ELSE column1
  END;
```

## IFNULL(), ISNULL(), COALESCE(), NVL()

만약 계산에 사용되는 컬럼에 NULL이 포함되어 있을 경우 사용할 수 있는 함수. NULL을 대신하여 반환할 값을 지정할 수 있다.

```sql
SELECT ISNULL(column, 1) * 2 AS CalculatedValue
FROM table_name;
```

|  DB 종류   |   함수   |
| :--------: | :------: |
|   MySQL    | IFNULL() |
| SQL Server | ISNULL() |
| MS Access  | IsNull() |
|   Oracle   |  NVL()   |

## Stored Procedure for SQL Server

자주 쓰는 쿼리문에 이름을 붙여 저장해놓고, 나중에 이름만으로 실행할 수 있음. 또한 쿼리의 일부분을 매개변수로 만들어 실행시 인자로 전달받을 수 있음.

새로운 프로시저 생성

```sql
CREATE PROCEDURE procedure_name
AS
sql_statement
GO;
```

만들어놓은 프로시저 실행

```sql
EXEC procedure_name;
```

특정 컬럼에서 찾고 싶은 값을 입력하면 그 값을 포함한 레코드를 모두 반환하는 프로시저 작성:

```sql
CREATE PROCEDURE SelectValue @parameter
AS
  SELECT * FROM column
  WHERE column = @parameter
GO;
```

## Comment

특정 라인을 주석 처리하여 실행을 막을 수 있음.

**MS Access는 주석을 지원하지 않음.**

싱글라인 주석:

```sql
-- This is comment
SELECT * FROM table_name;
```

멀티라인 주석:

```sql
/*
This is comment
This is comment
This is comment */
SELECT * FROM table_name;
```

## Operators

SQL 연산자 총정리

### SQL 산술 연산자

산술 연산자 모두 의미대로 동작함.

| 연산자 |    설명     |
| :----: | :---------: |
|   +    |   더하기    |
|   -    |    빼기     |
|   \*   |   곱하기    |
|   /    |   나누기    |
|   %    | 나머지 연산 |

### SQL 비트 연산자

| 연산자 |         설명         |
| :----: | :------------------: |
|   &    |     Bitwise AND      |
|   \|   |      Bitwise OR      |
|   ^    | Bitwise exclusive OR |

### SQL 비교 연산자

| 연산자 |         설명         |
| :----: | :------------------: |
|   =    |         같다         |
|   >    |     왼쪽이 크다      |
|   <    |    오른쪽이 크다     |
|   >=   |  왼쪽이 크거나 같다  |
|   <=   | 오른쪽이 크거나 같다 |
|   <>   |      같지 않다       |

### SQL 축약 연산자

| 연산자 | 설명 |
| :----: | :--: |
|   +=   | 생락 |
|   -=   |      |
|  \*=   |      |
|   /=   |      |
|   %=   |      |

### SQL 논리 연산자

| 연산자  |                      설명                       |
| :-----: | :---------------------------------------------: |
|   ALL   |     모든 값이 조건을 만족했을 때 참이 된다      |
|   ANY   |     어떤 값이 조건을 만족했을 때 참이 된다      |
|   AND   |         두 조건 모두 참일 때 참이 된다          |
|   OR    |           한 조건이 참이면 참이 된다            |
| BETWEEN |  왼쪽과 오른쪽 사이에 값이 위치하면 참이 된다   |
| EXISTS  | 서브 쿼리가 하나 이상의 값을 반환하면 참이 된다 |
|   IN    |     값이 목록 중 하나와 일치하면 참이 된다      |
|  LIKE   |         값이 패턴과 일치하면 참이 된다          |
|   NOT   |               거짓일 때 참이 된다               |
|  SOME   |                 ANY와 동일하다                  |
