# SQL 데이터베이스

## CREATE DATABASE

새로운 데이터베이스를 만드는 명령어.

```sql
CREATE DATABASE databasename;
```

**이 명령어를 사용하기 위해서는 관리자 권한이 필요함. 만들어진 데이터베이스를 확인하기 위해서는 `SHOW DATABASE` 명령어를 사용할 수 있음.**

## DROP DATABASE

기존의 데이터베이스를 삭제하는 명령어. 역시 관리자 권한이 필요하다.

```sql
DROP DATABASE databasename;
```

## BACKUP DATABASE

기존 데이터베이스의 백업본을 만드는 명령어.

```sql
BACKUP DATABASE databasename
TO DISK = 'filepath';
```

`WITH DIFFERENTIAL`을 추가해 마지막 백업과 비교하여 변경이 일어난 부분만 백업할 수 있음.

```sql
BACKUP DATABASE databasename
TO DISK = 'filepath'
WITH DIFFERENTIAL;
```

## CREATE TABLE

새 테이블을 만들 때 사용하는 명령어.

```sql
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);
```

ID, LastName, FirstName, Address, City 5개의 컬럼을 가진 Persons 테이블은 다음과 같이 만들 수 있다.

```sql
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);
```

`CREATE TABLE` 명령어는 기존 테이블을 복사할 때도 사용할 수 있다.

```sql
CREATE TABLE new_table_name AS
    SELECT column1, column2,...
    FROM existing_table_name
    WHERE ....;
```

## DROP TABLE

데이터베이스 내에서 테이블을 삭제할 때 사용하는 명령어.

```sql
DROP TABLE table_name;
```

혹은 `TRUNCATE`를 사용해 테이블은 그대로 놔두고 테이블 내의 데이터만 삭제할 수 있음.

```sql
TRUNCATE TABLE table_name;
```

## ARTER TABLE

기존 테이블에 새 컬럼을 추가하거나, 기존 컬럼을 삭제하거나 수정하는 명령어.

### 새 컬럼 추가

```sql
ALTER TABLE table_name
ADD column_name datatype;
```

### 기존 컬럼 삭제

```sql
ALTER TABLE table_name
DROP COLUMN column_name;
```

### 기존 컬럼 수정

데이터베이스별로 키워드가 다름.

#### SQL Server, MS Access

```sql
ALTER TABLE table_name
ALTER COLUMN column_name datatype;
```

#### My SQL, Oracle 10 이전 버전

```sql
ALTER TABLE table_name
MODIFY COLUMN column_name datatyle;
```

### Oracle 10 및 이후 버전

```sql
ALTER TABLE table_name
MODIFY column_name datatype;
```

## Constraints

테이블을 생성하거나 수정할 때 각 컬럼의 데이터 타입과 함께 데이터 규칙을 함께 설정할 수 있음.

```sql
CREATE TABLE table_name (
    column1 datatype constraint,
    column2 datatype constraint,
    column3 datatype constraint,
    ....
);
```

constraints를 설정함으로써 테이블의 정확성과 신뢰성을 높일 수 있음. 또한 의도치 않은 동작으로 데이터가 망가지는 것을 방지할 수 있음.

### NOT NULL

기본적으로 각 컬럼은 `NULL` 값을 가질 수 있다. constraint로 `NOT NULL`을 설정하면 해당 컬럼 혹은 테이블은 반드시 유의미한 값을 가져야 한다.

```sql
CREATE TABLE Person (
    ID int NOT NULL,
    Name varchar(255) NOT NULL
);
```

### UNIQUE

중복되는 값이 없는 컬럼을 만들 수 있다.

#### SQL Server, Oracle, MS Access

```sql
CREATE TABLE Person (
    ID int NOT NULL UNIQUE,
    Name varchar(255) NOT NULL
);
```

#### MySQL

```sql
CREATE TABLE Person (
    ID int NOT NULL,
    Name varchar(255) NOT NULL,
    UNIQUE(ID)
);
```

테이블의 유니크 컬럼에 이름을 붙이거나, 여러 컬럼을 유니크로 지정할 때는 다음과 같이 쓴다.

```sql
CREATE TABLE Person (
    ID1 int NOT NULL,
    ID2 int NOT NULL,
    Name varchar(255) NOT NULL,
    CONSTRAINT UNIQUE_PERSON UNIQUE (ID1, ID2)
);
```

유니크 constraint를 제거할 때는 아래와 같이 쓴다.

#### MySQL

```sql
ALTER TABLE Person
DROP INDEX UNIQUE_PERSON;
```

#### SQL Server, Oracle, MS Access

```sql
ALTER TABLE Person
DROP CONSTRAINT UNIQUE_PERSON;
```

### PRIMARY KEY

오직 테이블 안에 하나의 프라이머리 키만 존재할 수 있다. 또한 프라이머리 키는 자동으로 UNIQUE + NOT NULL의 특성을 갖는다.

**테이블 안에 하나의 프라이머리 키가 존재한다는 말이 하나의 컬럼만 프라이머리 키가 될 수 있다는 말은 아니다. 프라이머리 키는 여러 컬럼을 조합해서 만들어질 수도 있다.**

테이블을 생성할 때 특정 컬럼을 프라이머리 키로 설정하는 방법은 아래와 같다.

#### MySQL

```sql
CREATE TABLE Person (
    ID int,
    Name varchar(255) NOT NULL,
    PRIMARY KEY (ID);
)
```

#### SQL Server, Oracle, MS Access

```sql
CREATE TABLE Person (
    ID int PRIMARY KEY,
    Name varchar(255) NOT NULL
);
```

프라이머리 키에도 이름을 붙일 수 있다.

```sql
CREATE TABLE Person (
    ID int,
    Name varchar(255),
    CONSTRAINT PRIMARY_PERSON PRIMARY KEY (ID, Name);
)
```

위의 예시에서 볼 수 있듯이, 여러 컬럼을 조합하여 프라이머리 키를 만들 수 있다.

테이블에서 이미 만들어진 컬럼을 프라이머리 키로 만들 때는 아래와 같이 한다.

```sql
ALTER TABLE Persons
ADD PRIMARY KEY (ID);
```

```sql
ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);
```

프라이머리 키 constraint를 삭제할 때는 아래와 같이 한다.

#### MySQL

```sql
ALTER TABLE Persons
DROP PRIMARY KEY;
```

#### SQL Server, Oracle, MS Access

```sql
ALTER TABLE Persons
DROP CONSTRAINT PK_Person;
```

### FOREIGN KEY

다른 테이블의 프라이머리 키를 참조하는 컬럼을 만들 수 있음. 두 테이블의 특정 컬럼이 같은 대상을 가리키는 경우, 한 테이블에는 없는 값이 다른 테이블에 들어가 두 테이블 간의 연결 관계가 손상되는 일을 막을 수 있음.

Persons Table:

| PersonID | Name |
| :------: | :--: |
|    1     | Choi |
|    2     | Kim  |
|    3     | Lee  |

Orders Table:

| PersonID |  Order   |
| :------: | :------: |
|    1     |  Kimchi  |
|    2     | Bibimbap |
|    3     |  Kimbap  |

예를 들어 데이터베이스에 이런 테이블 두 개가 있을 때, 두 테이블은 `PersonID`로 연결되어 있음. `PersonID`가 같다면 두 테이블에서 모두 동일한 사람이라는 뜻임. 따라서 Persons 테이블의 PersonID를 프라이머리 키로 설정하고, Orders 테이블의 PersonID를 Persons 테이블의 PersonID를 참조하는 Foreign key로 설정하면 두 테이블의 관계를 보호할 수 있음.

#### MySQL

```sql
CREATE TABLE Orders (
    PersonID int,
    Order varchar(255),
    FOREIGN KEY (PersonID) REFERENCE Persons(PersonID)
);
```

#### SQL Server, Oracle, MS Access

```sql
CREATE TABLE Orders (
    Orders varchar(255),
    PersonID int FOREIGN KEY REFERENCES Person(PersonID)
);
```

Foreign key에서도 키의 이름을 설정하거나 여러 컬럼을 대상으로 등록하기 위해서는 `CONSTRAINT` 키워드를 사용함.

```sql
CREATE TABLE Orders (
    PersonID int,
    OrderID varchar(255),
    CONSTRAINT FK_PersonID FOREIGN KEY (PersonID) REFERENCES(PersonID)
)
```

이미 Orders 테이블이 존재할 경우, 아래와 같은 방법으로 Foreign key를 등록할 수 있다.

```sql
ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);
```

```sql
ALTER TABLE Orders
ADD CONSTRAINT FK_PersonID
FOREIGN KEY (PersonID) REFERENCES Person(PersonID);
```

DROP을 사용하여 Foreign key를 테이블에서 해제할 수 있다.

#### MySQL

```sql
ALTER TABLE Orders
DROP FOREIGN KEY FK_PersonID;
```

#### SQL Server, Oracle, MS Access

```sql
ALTER TABLE Orders
DROP CONSTRAINT FK_PersonID;
```

### CHECK

컬럼에 저장되는 데이터를 검사할 수 있다.

#### MySQL

```sql
CREATE TABLE Persons (
    ID int NOT NULL,
    Age int NOT NULL,
    CHECK (Age > 0)
);
```

#### SQL Server, Oracle, MS Access

```sql
CREATE TABLE Persons (
    ID int NOT NULL,
    Age int NOT NULL CHECK (Age > 0)
);
```

`CHECK` Constraint에 이름을 붙이거나 여러 컬럼에 적용할 경우 `CONSTRAINT` 키워드를 쓸 수 있다.

```sql
CREATE TABLE Person (
    ID int NOT NULL,
    Age int NOT NULL,
    CONSTRAINT CHK_Person CHECK (Age > 0)
);
```

이미 만들어진 테이블의 컬럼에 `CHECK` Constraint를 추가하고자 할 경우 아래와 같이 쓴다.

```sql
ALTER TABLE Person
ADD CHECK (Age > 0);
```

```sql
ALTER TABLE Person
ADD CONSTRAINT CHK_Person CHECK (Age >0);
```

만든 `CHECK` Constraint를 제거할 때는 다음과 같이 쓴다.

#### SQL Server,

```sql
ALTER TABLE Person
DROP CONSTRAINT CHK_Person;
```

#### MySQL

```sql
ALTER TABLE Person
DROP CHECK CHK_Person;
```

### DEFAULT

새 레코드가 생성될 때 특정 컬럼에 값을 입력하지 않으면 미리 설정된 값이 대신 입력되도록 할 수 있음.

```sql
CREATE TABLE Person (
    ID int NOT NULL,
    Name varchar(255) DEFAULT 'NoName'
);
```

혹은 시스템 함수를 사용하여 적절한 값이 자동으로 입력되도록 할 수 있음.

```sql
CREATE TABLE Person (
    ID int NOT NULL,
    CreatedDate date DEFAULT GETDATE()
);
```

이미 만들어진 테이블에서 특정 컬럼에 디폴트 값을 설정하는 방법은 다음과 같음.

#### MySQL

```sql
ALTER TABLE Person
ALTER Name SET DEFAULT 'NoName';
```

#### SQL Server

```sql
ALTER TABLE Person
ADD CONSTRAINT DF_Name
DEFAULT 'NoName' FOR Name;
```

#### MS Access

```sql
ALTER TABLE Person
ALTER COLUMN Name SET DEFAULT 'NoName';
```

#### Oracle

```sql
ALTER TABLE Person
MODIFY Name DEFAULT 'NoName';
```

설정했던 기본값을 제거할 때는 아래와 같이 쓴다.

#### MySQL

```sql
ALTER TABLE Person
ALTER Name DROP DEFAULT;
```

#### SQL Server, Oracle, MS Access

```sql
ALTER TABLE Person
ALTER COLUMN Name DROP DEFAULT;
```

## CREATE INDEX

테이블에 인덱스를 설정하여 검색 및 쿼리 성능을 향상시킨다. 하지만 데이터 삽입하거나 업데이트 할 때 성능이 저하되므로 빠른 검색이 필요한 테이블에만 사용해야 한다.

```sql
CREATE INDEX index_name
ON table_name (column1, column2, ...);
```

### UNIQUE INDEX

중복값을 허용하지 않는 인덱스를 생성할 수 있다.

```sql
CREATE UNIQUE INDEX index_name
ON table_name (column1, column2, ...);
```

만든 인덱스를 삭제할 때는 `DROP` 키워드를 쓴다.

### MS Access

```sql
DROP INDEX index_name ON table_name;
```

#### SQL Server

```sql
DROP INDEX table_name.index_name;
```

### DB2, Oracle

```sql
DROP INDEX index_name;
```

#### MySQL

```sql
ALTER TABLE table_name
DROP INDEX index_name;
```

## AUTO INCREMENT

테이블의 특정 컬럼에 새 레코드가 삽입될 때마다 1부터 시작하여 1씩 증가하는 고유한 ID를 만들 수 있다.

### MySQL

```sql
CREATE TABLE Person (
    ID int NOT NULL AUTO_INCREMENT,
    Name varchar(255) NOT NULL,
    PRIMARY KEY (ID)
);
```

위의 쿼리를 통해 Person 테이블을 생성하면 새 레코드가 추가될 때마다 ID 값이 1부터 1씩 자동으로 증가하여 삽입된다.

`AUTO_INCREMENT`의 시작값을 직접 설정할 수도 있다.

```sql
ALTER TABLE Person AUTO_INCREMENT = 100;
```

### SQL Server

```sql
CREATE TABLE Person (
    ID int IDENTITY(1, 1) PRIMARY KEY,
    Name varchar(255)
);
```

`IDENTITY(초기값, 증가량)` 함수로 auto increment를 설정한다.

### MS Access

```sql
CREATE TABLE Person (
    ID AUTOINCREMENT(1, 1) PRIMARY KEY,
    Name varchar(255) NOT NULL
)
```

### Oracle

오라클의 경우 시퀸스 객체를 생성한 후, 해당 객체를 테이블 내에서 사용해야 한다.

```sql
CREATE SEQUENCE seq_person
MINVALUE 1
MAXVALUE 999999
START WITH 1
INCREMENT BY 1
CACHE 10;
```

이름에서 알 수 있듯이, `MINVALUE`는 시퀸스가 가질 수 있는 최소값, `MAXVALUE`는 최대값, `START WITH`은 시작값, `INCREMENT BY`는 증가량이다. `CACHE`는 성능을 위해 한 번에 메모리에 저장할 값의 개수를 의미한다.

## VIEW

뷰는 한 테이블 혹은 여러 테이블에서 데이터를 선택적으로 가져와 보여주고 싶은 정보만 보여줄 수 있는 가상 테이블이다. 원본 테이블이 업데이트 될 때마다 뷰도 자동으로 최신 정보를 반영한다.

```sql
CREATE VIEW view_name AS
SELECT colum1, colum2, ...
FROM table_name
```

> 뷰 이름(테이블, 컬럼 이름도 마찬가지로)이 공백을 포함하고 있을 경우, 이름을 대괄호([])로 감싼다.

이미 만들어진 뷰를 수정할 때는 `CREATE VIEW` 대신 `CREATE OR REPLACE VIEW` 키워드를 사용한다.

```sql
CREATE OF REPLACE VIEW AS
SELECT colum1, colum2, new_colum, ...
FROM table_name;
```
