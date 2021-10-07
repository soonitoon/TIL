## 클래스 기본

```java
class Car {
    // 필드
    String name;
    int price;

    // 메소드
    void go() {};
    void stop() {};
}
```

```java
// 슈퍼 슬래스
class Car {
    String name;
    int price;

    void go() {};
    void stop() {};
}

// 서브 클래스
class Bus extends Car {
    // 슈퍼 클래스의 모든 필드, 메소드 상속
    void openDoor() {};
}
```

`new` 키위드를 사용해 객체 생성

```java
Bus tayo = new Bus();
```

## 생성자

```java
public class Circle {
    int radius;
    public Circle() {
        radius = 1;
    }
}
```

- 클래스 이름과 같게.
- 여러 생성자 작성 가능.
- 리턴 타입 없음(언제나 `void`).
- 생성자가 없으면 컴파일러가 기본 생성자 자동 삽입.

맴버 변수와 메소드 변수의 이름이 같은 경우 `this` 사용.

```java
public class Circle {
    int radius;
    public Circle(int radius) {
        this.radius = radius;
    }
}
```

생성자 내에서 `this()`를 쓰면 다른 생성자 호출 가능.

- 생성자 내에서만 사용.
- 생성자 코드 제일 처음에 사용해야 함.

```java
public class Book {
    String title;
    String author;

    public Book(String title) {
        this(title, "작자미상");
    }
    public Book(String title, String author) {
        this.title = title;
        this.author = author;
    }
}
```

객체의 치환에서 복사되는 것은 객체 자체가 아니라 레퍼런스임.

```java
Book b1 = new Book("litte prince");
Book b2 = b1;
```

객체 배열을 만들 수 있다.

```java
Book[] books = new Book[5];

for (int i=0; i<books.length; i++) {
    books[i] = new Book("");
}
```

## 객체 소멸 & 가비지 컬렉션

- 가비지: 가리키는 레퍼런스가 없는 객체
- 객체 소멸: `new`로 할당된 객체 메모리를 가용 메모리로 되돌리는 행위.
- 가비지 컬렉터가 자동으로 가비지를 수집함.

```java
Person a = new Person("김");
Person b = new Person("최");
b = a // b가 가리켰던 객체가 가비지가 됨.
```

강제 가비지 컬렉션 수행: `System.gc();`
