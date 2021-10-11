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
