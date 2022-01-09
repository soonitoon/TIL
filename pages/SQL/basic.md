# SQL 공부 내용 정리

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
  - `BETWEEN a AND b`: a와 b 사이
  - `LIKE pattern`: 패턴과의 일치 여부
  - `IN (a, b, c)`: a, b, c 안에 들어있는지의 여부

- 각 조건들은 논리 연산자로 묶을 수 있음(AND, OR, NOT).

```sql
SELECT column1 FROM table_name WHERE Country = 'USA' AND Price < 10;
```
