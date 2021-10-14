## `abstract class`

Typescript를 사용하면 Java와 같은 `abstract class` 사용 가능.

```typescript
// 추상 클래스 선언
abstract class SayHello {
  // 추상 메소드 선언
  abstract getName(): string;

  printName() {
    console.log(`Hello, ${this.getName()}`);
  }
}

class Choi extends SayHello {
  getName() {
    return "Choi";
  }
}

const choi = new Choi();
choi.printName();
```

대부분의 기능을 미리 구현해놓고, 서브 클래스에서 필요한 부분만 오버라이당한다.
