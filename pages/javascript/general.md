## 오브젝트 선언 방법

```javascript
// 생성자 사용
const newObj = new Object();

// create() 메소드 사용
const newObj = Object.create({});

// 오브젝트 리터럴 사용
const newObj = {};
```

## `throw`

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

## `Error` 객체

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

## 비트 연산자

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
