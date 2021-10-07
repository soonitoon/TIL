- non-static 멤머

  - 공간적: 객체마다 별도 존재.
  - 시간적: 객체 생성 후 사용 가능.
  - 비공유: 객체마다 배타적.

- static 맴머
  - 공간적: 클래스 당 하나만 생성.
  - 시간적: 클래스 로딩 시 공간 할당.
  - 공유: 동일 클래스의 모든 객체들이 공유함.

`static`은 전역 변수, 전역 함수를 만들 때 사용.

```java
class StaticSample {
    public int n;
    public static int m;

    public static void main(String[] args) {
        StaticSample s1 = new StaticSample();
        StaticSample s2 = new StaticSample();

        s1.n = 1;
        s1.m = 1;
        s2.n = 2;
        s2.m = 2;

        System.out.println(s1.n); // 1
        System.out.println(s1.m); // 2
    }
}
```

## static 메소드의 제약조건

1. `non-static` 멤머에 접근 불가.
2. `this` 사용 불가.
