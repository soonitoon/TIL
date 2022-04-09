# 자바스크립트 내장 객체 메소드 정리

## Array

### `Array.prototype.reduce(callback, initalValue)`

이전 값과 현재 값을 다루는 `reducer` 함수를 콜백으로 받음. 가장 간단한 예시는 리스트 안의 값 전부 더하기.

```javascript
const numbers = [1, 2, 3];
const sum = (pre, curr) => pre + curr;
const result = numbers.reduce(sum);
console.log(result); // 6
```

`initialValue`는 옵션임. 지정해주면 `initialValue`가 첫 번째 pre, 리스트의 0번째 인덱스 값이 curr로 들어감. 따로 지정하지 않는다면 리스트의 0번째 인덱스 값이 pre, 1번쨰 인덱스 값이 curr로 들어감.

`reducer` 콜백 함수는 `pre`와 `curr`을 인자로 받음. pre에는 리듀서 함수의 이전 반환값(첫 실행이라면 initial or 리스트의 첫 요소) crr에는 리스트의 현재 값이 들어감.

나중에 헷갈릴 자신을 위한 [MDN 링크](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce)

### `Array.prototype.shift()`

배열의 첫 번째 요소를 제거하는 동시에 반환한다. 빈 배열에 사용할 경우 반환값은 `undefined`.

```javascript
const array = [1, 2, 3];
const result = array.shift();
console.log(array); // [2, 3]
console.log(result); // 1
```

### `Array.prototype.splice()`

`splice(startIndex, deleteCount, newItem)`

배열의 요소 중 시작 인덱스부터 `deleteCount`만큼을 삭제한 후 반환한다. 삭제한 자리에는 새로운 아이템을 넣는다.

- 첫 인덱스만 전달하면 첫 인덱스부터 배열의 끝까지 적용
- 첫 인덱스와 끝 인덱스를 입력하면 해당 범위까지 적용.
- 첫 인덱스 + 끝 인덱스 + 새로운 아이템을 전부 건네주면 삭제한 자리에 새로운 아이템을 대신 넣는다.

자바스크립트에서 특정 인덱스의 값을 제거하고 싶을 때 간단하게 사용할 수 있음.

#### 특정 인덱스의 아이템 삭제하기

```javascript
let arr = [1, 2, 3];
arr.splice(2, 1);
console.log(arr); // [1, 2]
```

위와 같이 `newItem`을 넘겨주지 않고 `deleteCount`를 1로 설정하면 해당 인덱스의 아이템만 삭제한다.

### `Array.prototype.sort()`

아무런 인자도 주어지지 않으면 `sort()` 는 해당 배열의 각 요소들을 문자열로 변환한 뒤, 유니코드 순서에 따라 정렬함. 즉, 800이 9보다 앞에 위치하게 됨.

만약 숫자 리스트를 오름차 / 내림차로 정렬하고 싶다면 비교 함수를 인자로 넘겨주어야 한다.

```javascript
let arr = [3, 200, 40];
arr.sort();
console.log(arr); // [200, 3, 40]
arr.sort((a, b) => a - b);
console.log(arr); // [3, 40, 200]
```

비교 함수는 두 매개변수를 받아 음수, 양수, 0 중 하나를 반환해야 함.

- 만약 반환값이 음수라면: a가 b보다 낮은 인덱스가 됨.
- 만약 반환값이 0이라면: 아무것도 안 함.
- 만약 반환값이 양수라면: a가 b보다 높은 인덱스가 됨.

실제 정렬은 메소드 내부적으로 일어나므로, 위 규칙에 따라 비교함수만 작성해주면 됨.

### `Array.prototype.slice(start, end)`

- 해당 배열에서 `start`부터 `end - 1`까지의 인덱스 범위를 잘라 새로운 배열로 반환함.
- 호출한 배열은 건드리지 않는다.
- 음수 인덱스 사용 가능.

```javascript
const arr = [1, 2, 3];
const subArr = arr.slice(0, 2);
console.log(subArr); // [1, 2]

const subArr2 = arr.slice(-2);
console.log(subArr2); // [2, 3]
```

### `Array.prototype.push()`

- `push` 메소드의 반환값은 새로운 배열의 길이.

```javascript
const arr = [];
console.log(arr.push("hello")); // 1
```

### forEach 동작 도중 특정 조건에서 멈추는 방법

**없음**. forEach문은 호출한 배열의 모든 요소를 돌며 콜백 함수를 실행한다. 만약 특정 조건에서 순환을 멈추고 싶다면 `forEach`를 쓰면 안 된다.

## Number

### `Number.prototype.toString()`

`toString(2)`와 같은 방법으로 해당 숫자를 이진수로 변환하기. `toString()` 메소드에 인자로 2 <= n <= 36 범위의 숫자를 넘겨 해당 진수로 변환할 수 있다.

### `Number.prototype.toFixed()`

실수를 고정소수점으로 반올림할 수 있음. 인자를 주지 않으면 정수로 반올림함. == 0을 인자로 준 것과 같음. 자연수를 인자로 넘기면 해당 자리의 소수점까지 반올림하여 표시됨.

```javascript
const float = 1.264;
console.log(float.toFixed()); // 1
console.log(float.toFixed(1)); // 1.3
```

### `Number.isInteger(value)`

인자로 받은 수가 정수인지 아닌지를 판별. 불리언 값을 반환한다.

## String

### `String.prototype.padStart(len, str)`

해당 문자열의 길이가 `len` 이 될 때까지 문자열의 앞에 `str` 을 추가해나간다.

### `String.prototype.padEnd(len, str)`

해당 문자열의 길이가 `len`이 될 때까지 문자열의 뒤에 `str` 을 추가해나간다.

### `String.prototype.replace(regex, newStr)`

- 문자열 안에서 `regex`과 매치되는 첫 번째 부분을 `newStr`로 변환한 문자열을 반환함.
- 모든 매치를 변환하고 싶다면 정규식 뒤에 `g` 옵션을 붙여주면 됨.
- **기존 문자열을 변화시키지 않음.**

```javascript
const regex = /hello/g;
const test = "hello, I'm Hyuno";
const newTest = test.replace(regex, "goodbye");

console.log(newTest); // goodbye, I'm Hyuno
console.log(test); // hello, I'm Hyuno
```

### `String` 메소드를 활용한 UTF-16 인코딩 / 디코딩

"알파벳을 얼마만큼 옮기시오~" 같은 느낌의 코테 문제를 풀 때 알아두면 유용하다.

- 인코딩: `String.prototype.charCodeAt(index)`
- 디코딩: `String.fromCharCode(UTF-16)`

### `String.prototype.match(regex)

- 문자열에서 정규표현식과 일치하는 부분을 찾아 **배열**로 반환한다. 반환되는 배열은 정규식의 글로벌 옵션(`g`)에 따라 다르다.
- 글로벌 옵션이 있다면 해당 패턴과 매칭되는 모든 문자열이 담긴 배열을 반환한다.
- 글로벌 옵션이 없다면 해당 패턴과 **가장 먼저** 매칭되는 문자열이 담긴 배열을 반환하는데, **특별한 속성**이 추가된 배열이다.
  - `index`: 해당 패턴이 원본 문자열에서 위치하는 인덱스.
  - `input`: 원본 문자열.
  - `groups`: 캡쳐 그룹의 그룹명과 매칭 문자열이 키-값 쌍으로 저장된 객체. 캡쳐를 사용하지 않으면 `undefined` 값을 갖는다.
- 글로벌 옵션 없이 캡쳐를 사용하는 경우, 매칭된 전체 문자열이 첫 번째 요소로 들어가며, 캡처된 문자열이 순서대로 배열 안에 들어간다.

```javascript
const regex = /(?<first>he)(?<second>llo)/;
const string = "hello";

console.log(string.match(regex));
// [
//   'hello',
//   'he',
//   'llo',
//   index: 0,
//   input: 'hello',
//   groups: [Object: null prototype] { first: 'he', second: 'llo' }
// ]
```

## Object

### `Object.keys()`

인자로 받은 객체의 키들을 문자열로 변환해 배열에 담아 반환함.

```javascript
const testObj = {
  a: 1,
  b: 2,
  c: 3,
};
const keyArr = Object.keys(testObj);
console.log(keyArr); // ['a', 'b', 'c']
```

### `Object.entries()`

인자로 받은 객체의 속성과 값이 담긴 배열을 배열에 담아 반환. 이때 속성명은 문자열로 변환됨.

```javascript
const obj = {
  a: 1,
  b: 2,
  c: 3,
};
const result = Object.entries(obj);
console.log(result); // [['a', 1], ['b', 2], ['c', 3]]
```

## Math

### `Math.max()`

n 개의 숫자를 전달하면 그 중 최대값을 찾아주는 메소드. 이때 배열이 아니라 **n개의 정수**를 인자로 넘겨야 한다는 것을 잊지말자. 배열이 있을 경우 전개 연산자와 함께 사용할 수 있다.

```javascript
const arr = [1, 2, 3];
const max = Math.max(...arr);
console.log(max); // 3
```

### `Math.sqrt()`

매개변수로 받은 수의 양의 제곱근을 반환함.

```javascript
console.log(Math.sqrt(4)); // 2
```

## Map

키와 값의 쌍을 저장하고, 키를 사용해 값을 불러올 수 있는 자바스크립트 오브젝트. 키-값 쌍을 저장한 순서가 유지된다.

### 기본 사용법

```javascript
const map = new Map();
map.set(1, "apple");
map.set(2, "orange");
map.set(3, "mango");

console.log(map.get(1)); // apple
console.log(map.get(2)); // orange
console.log(map.get(3)); // mango

console.log(map.size); // 3
```

### 메소드

- `clear()` : 해당 맵의 모든 쌍 삭제.
- `delete(key)` : 해당 키와 키의 값 삭제. 삭제 성공시 `true`, 실패시 `false` 반환.
- `get(key)` : 해당 키와 연결된 값 반환.
- `has(key)` : 키와 연결된 값이 있는지의 여부를 불리언 값으로 반환.
- `set(key, value`) : 해당 맵에 키-값 쌍을 새로 저장.

### 이터레이션 메소드

- `keys()` : 해당 맵의 키들이 담긴 이터레이터 객체 반환.

```javascript
const map = new Map();

map.set(1, "mango");
map.set(2, "orange");
map.set(3, "pineapple");

const iterator = map.keys();

let result = iterator.next();

while (!result.done) {
  console.log(result.value);
  result = iterator.next();
}
// 1
// 2
// 3
```

- `values()` : 해당 맵의 값들이 담긴 이터레이터 객체 반환.

```javascript
const map = new Map();

map.set(1, "mango");
map.set(2, "orange");
map.set(3, "pineapple");

const iterator = map.values();

let result = iterator.next();

while (!result.done) {
  console.log(result.value);
  result = iterator.next();
}
// mango
// orange
// pineapple
```

## RegExp

### 선언법

```javascript
const regex1 = /abc/g;
// literal notation.
// 슬래시로 패턴을 감싸고, 뒤에 옵션을 붙인다.

const regex2 = new RegExp("abc", "g");
// RegExp() 생성자 사용.
// 패턴과 옵션을 문자열로 인자로 넘긴다.

const regex3 = new RegExp(/abc/, "g");
// RexExp() 생성자 사용법 2.
// 패턴을 literal notation으로, 옵션을 문자열로 넘긴다.
```

`Document.importNode()`

```typescript
importNode(node: Node, deep?: boolean)
```

- [Ref](https://developer.mozilla.org/en-US/docs/Web/API/Document/importNode)
- 인자로 받은 `Node` 객체를 복사해서 현재 `document`로 가져오는 메소드.
- `importNode` 메소드만으로는 `document`안에 삽입되지 않음.
  - `appendChild()` 등의 메소드로 삽입해주어야 함.
