## 인터페이스

```java
// Person.java
interface Person {
    void sayHello(String name);

    void returnAge(byte age);
}

// Choi.java
public class Choi implements Person {
    public void sayHello(String name) {
        System.out.println("Hello," + name);
    }

    public void returnAge(byte age) {
        System.out.println("I'm" + age + "years old.");
    }
}
```

- 인터페이스를 구현할 때는 `implements` 키워드를 사용함.
- 인터페이스 안에는 정의할 수 있는 메소드는 다음과 같다.
  - 추상 메소드: 바디를 가질 수 없고, 구현하는 클래스에서 반드시 완성해야 함.
  - 디폴트 메소드: 인터페이스에서 정의하되, 클래스에서 오버라이딩 할 수 있음.
  - static 메소드: 인터페이스에서 완성하고, 클래스에서 오버라이딩 할 수 없음.
- 필드는 `final public static`만 정의할 수 있음(키워드를 생략해도 됨). == 상수만 정의 가능.
- 인터페이스가 인터페이스를 상속받을 수 있음.
