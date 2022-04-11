리액트 함수형 컴포넌트 매개변수 타입 정의 시 팁.

- 리액트 함수형 컴포넌트의 프롭 타입을 정의할 때, 어차피 해당 파일 안에서만 사용할 타입이라면 `LongFunctionNameProps` 같이 장황하게 이름을 짓지 않고 그냥 `Props`로 간단하게 만드는 게 나음.

```typescript
interface Props {
    a: Type1,
    b: Type2,
}

const Component = ({a, b}: Props) => {
    ...
}
```

`abstract class`

- Typescript를 사용하면 Java와 같은 `abstract class` 사용 가능.

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

- 대부분의 기능을 미리 구현해놓고, 서브 클래스에서 필요한 부분만 오버라이당한다.

`Exclude<Union, ExcludeMembers>`

- 타입스크립트 유틸 타입의 한 종류
- 유니온 타입에서 특정 타입(들)을 제거한다.

```typescript
Type = Exclude<"a" | "b", "a">;
// type Type = "b"
```

`declare`

- 타입스크립트에서 사용하고 싶은 변수가 다른 자바스크립트 파일에 있거나, 동적으로 불러오는 것일 때 타입스크립트 컴파일러에게 "이건 존재하는 변수니까 에러로 처리하지 말 것"이라고 알려주는 역할.
- `declare`로 선언된 변수는 자바스크립트 코드로 컴파일되지 않는다.

```typescript
// 외부 자바스크립트 파일
const data = [1, 2, 3, 4];

// 타입스크립트 파일
declare const data: number[];

console.log(data);
// 오류가 발생하지 않음.
```

`unknown` vs `any`

[Ref](https://simsimjae.tistory.com/464)

- `any`는 타입을 지정하지 않은 것과 동일함.
  - 어떤 속성에 접근하던 타입 체커가 신경쓰지 않음.
- `unknown`은 타입의 범위를 좁혀 사용해야 할 의무를 가짐.
  - `unknown` 상태에서는 어떤 속성에도 접근할 수 없음.
  - 반드시 조건문으로 타입을 좁혀 사용해야 함.
