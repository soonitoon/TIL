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

## 상속

서브 클래스에서 슈퍼 클래스의 생성자 하나를 선택할 수 있음(매개변수의 개수에 따라 자동 선택). 아무 생성자도 선택하지 않을 경우, 자동으로 슈퍼 클래스의 기본 생성자가 삽입됨.

업캐스팅 & 다운캐스팅

**업캐스팅**: 서브 클래스 타입의 객체를 슈퍼 클래스 타입으로 바꾸는 것.

```java
class Student extends Person {
    ...
}

Student s = new Student();

Person p = s; // 업캐스팅
// 이후 서브 클래스 멤버 접근 불가(슈퍼 클래스의 메모리 공간으로 한정되기 때문).

// instanceof 키워드로 업캐스팅된 객체의 원래 타입을 알 수있음.

System.out.println(s instanceof Person) // true
System.out.println(s instanceof Student) // true
```

**다운캐스팅**: 업캐스팅된 서브 클래스를 되돌리는 것.

```java
class Student extends Person {
    ...
}

Person p = new Student(); // 업캐스팅

Student p = (Student) s; // 다운캐스팅
```

## 추상 클래스

추상 클래스: 추상메소드를 하나 이상 가지거나, `abstract` 키워드가 붙은 클래스.

```java
// Animal.java
abstract class Animal {
    abstract void say();

    void eat(String food) {
        System.out.println("냠냠");
    }
}

// Person.java
class Person extends Animal {
    void say() {
        System.out.println("안녕하세요.");
    }
}

// Cat.java
class Cat extends Animal {
    void say() {
        System.out.println("야옹.");
    }
}

```

- 추상 클래스를 상속받으면 추상 메소드를 모두 구현해야 함. 그렇지 않으면 에러 발생.
- 추상 메소드를 추상 메소드가 상속받을 수도 있음.
