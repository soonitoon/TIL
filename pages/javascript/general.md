오브젝트 선언 방법

```javascript
// 생성자 사용
const newObj = new Object();

// create() 메소드 사용
const newObj = Object.create({});

// 오브젝트 리터럴 사용
const newObj = {};
```

`throw`

- 사용자 정의 에러를 발생시킬 수 있음.
- 함수 블럭 안에서 사용하면 함수 실행이 즉시 중지됨.
- `try-catch` 블럭 안에서 사용하면 `catch` 구문으로 넘어감.

```javascript
const sum = (n, m) => {
  if (!n || !m) throw "Error!";
  return n + m;
};

try {
  sum(1);
} catch (err) {
  console.log(err); // Error! 출력
}
```

`Error` 객체

런타임 도중 에러가 발생하면 `throw` 된다. `new` 생성자를 사용해서 직접 정의할 수도 있음.

```javascript
try {
  const a = nothing;
} catch (err) {
  console.log(err.name); // ReferenceError
  console.log(err.message); // nothing is not defined
}
```

```javascript
try {
  throw new Error("Something went wrong!");
} catch (err) {
  console.log(err); // Something went wrong!
}
```

비트 연산자

- `|` : OR
- `&` : AND
- `^` : XOR

```javascript
console.log(1 | 0); // 1
console.log(1 & 0); // 0
console.log(1 ^ 0); // 1

console.log(1 | 2); // 3

// 1 = 0001
// 2 = 0010
// ----------
// 3 = 0011
```

`toString() & parseInt()`

코딩 테스트에서 정수를 특정 진법으로 변환한 후에 어떤 처리를 하고, 다시 정수로 변환하는 문제에서 유용하게 쓸 수 있는 쌍.

```javascript
const int = 3;
let decimal = int.toString(3); // 정수 => 3진법 문자열 변환
// 어떤 처리
const result = decimal.parseInt(3); // 3진법 문자열 => 정수 변환
```

동적 `import`([Ref](https://ko.javascript.info/modules-dynamic-imports))

- 자바스크립트 `import` 문은 정적임.
  - 변수를 통해 `import` 문에 경로를 전달할 수 없음.
  - 런타임이나 조건부로 `import` 할 수 없음.
  - 위의 기능을 지원하지 않는 이유는 번들링 및 가지치기 작업이 불가능하기 때문.
- `import(module)` 표현식 사용하기.
  - `import(module)`은 모듈이 `export`하는 것들이 담긴 객체를 프로미스로 반환함.
  - 코드 내부 어디에서든지 동적으로 호출할 수 있음.

코드 예시:

```javascript
// src/
// ├─ say.js
// ├─ main.js

// say.js
const say = () => console.log("Hi");
const hi = () => console.log("say");

export { say, hi };

// main.js
const { say, hi } = await import("./say.js");

say(); // Hi
hi(); // say
```

- `export default`로 내보낸 모듈은 `default` 키로 참조 가능.

코드 예시:

```javascript
// say.js
const say = () => console.log("Hi");
const hi = () => console.log("say");

export { say };
export default hi;

// main.js
const { say, default: hi } = await import("./say.js");

say(); // Hi
hi(); // say
```

`A instanceof B`

- A가 B의 인스턴스인지 아닌지를 불리언 값으로 반환하는 연산자.
- 프로토타입 체인으로 연결되어 있다면 직속 인스턴스가 아니어도 `true`를 반환한다.
  - 예) 모든 객체는 `Object`에 대해 언제나 인스턴스다.
