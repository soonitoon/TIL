## 인자 전달방식

- 기본 타입의 경우:

  - 값이 복사되어 전달.
  - 매개변수가 변경되어도 실인자 값은 변경되지 않음.

```java
public class Test {
    public static void main(String[] args) {
        int n = 10;

        public void increase(int num) {
            num += 1;
        }

        increase(n);
        System.out.println(n); // 10
    }
}
```

- 객체 혹은 배열의 경우:
  - 객체, 배열의 레퍼런스 전달.
  - 매개변수와 실인자가 값을 공유함.

## 메소드 오버로딩

- 이름이 동일하고 매개변수의 개수나 타입이 다름.
- 리턴 타입은 관계 없음.

```java
class Method {
  public int sum(int i, int j) {
    return i + j;
  }
  public int sum(int i, int j, int k) {
    return i + j + k;
  }
}
```
