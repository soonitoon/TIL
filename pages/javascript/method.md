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

`splice(startIndex, endIndex, newItem)`

배열의 요소 중 시작 인덱스부터 끝 인덱스까지를 삭제한 다음 반환한다. 삭제한 자리에는 새로운 아이템을 넣는다.

- 첫 인덱스만 전달하면 첫 인덱스부터 배열의 끝까지 적용
- 첫 인덱스와 끝 인덱스를 입력하면 해당 범위까지 적용.
- 첫 인덱스 + 끝 인덱스 + 새로운 아이템을 전부 건네주면 삭제한 자리에 새로운 아이템을 대신 넣는다.

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

## Number

`Number.prototype.toString(2)`

해당 숫자를 이진수로 변환하기. `toString()` 메소드에 인자로 2 <= n <= 36 범위의 숫자를 넘겨 해당 진수로 변환할 수 있다.

## String

`String.prototype.padStart(len, str)`

해당 문자열의 길이가 `len` 이 될 때까지 문자열의 앞에 `str` 을 추가해나간다.

`String.prototype.padEnd(len, str)`

해당 문자열의 길이가 `len`이 될 때까지 문자열의 뒤에 `str` 을 추가해나간다.
