## `querySelector()`로 여러 클래스 가진 요소 선택하기

`querySelector('.class1.class2.class3')` 같은 방법으로 할 수 있음.

## `Array` vs `NodeList`

`querySelectorAll()` 등의 javascript DOM API를 사용해서 여러 HTML 엘리먼트를 가져오는 경우, 엘리먼트들이 '배열'에 담겨온다. (오늘까지의 나를 포함한) 초보 개발자의 경우 이 배열을 javascript의 Array와 같다고 볼 수 있다. 하지만 이 배열은 Array 객체가 아니라 NodeList 객체다.

습관적으로 `splice()` 등의 Array 메소드를 사용하려 하지만, NodeList에는 해당 메소드가 없기 때문에 오류가 발생한다. NodeList 객체에서 사용할 수 있는 메소드는 [MDN](https://developer.mozilla.org/en-US/docs/Web/API/NodeList) 설명 참고.

만약 NodeList가 아니라 Node 객체가 담겨있는 Array를 사용하고 싶다면 NodeList를 Array로 변환하면 된다.

```javascript
const nodes = document.querySelectorAll(".target");

// 방법 1
const nodeArray = Array.from(nodes);

// 방법 2
let emptyArray = [];
nodes.forEach((node) => emptyArray.push(node));
```

### Live NodeList

`Node.childNodes`를 사용해서 노드들을 받아온 경우, DOM에 가한 변화는 실시간으로 NodeList에 반영된다.

```javascript
const parent = document.querySelector(".target");
let children = parent.childNodes;
console.log(children.length); // 만약 3이라면
parent.appendChild(document.createElement("div"));
console.log(children.length); // 자동으로 4로 변한다.
```

### Static NodeList

`querySelectorAll()` API를 사용해 받아온 NodeList는 DOM과의 연결고리가 끊어져있다.

## `innerText` vs `innerHTML` vs `textContent`

### `innerHTML`

```javascript
const content = element.innerHTML; // element의 내부 요소들을 String으로 가져옴.

element.innerHTML = "<div>New div!</div>"; // element의 내부 요소를 String으로 설정 가능.
element.innerHTML = ""; // 빈 문자열을 할당하여 element 내부의 모든 요소 삭제 가능.
```

`innerHTML`은 [HTML 엔티티](/pages/html/htmlEntities.md)를 그대로 받아옴(`<` => `&lt`).

⚠️ 사용자가 입력한 텍스트를 아무런 검증 없이 `innerHTML`을 통해 도큐먼트 내 요소에 삽입하는 경우, XSS 공격에 매우 취약해진다.

```javascript
const container = document.querySelector('.container');
...
container.innerHTML = inputValue
```

위의 예시에서 `container` 엘리먼트에 사용자 입력 텍스트를 `innerHTML`을 통해 바로 집어넣었다고 가정했을 때, `<img src='x' onerror='**attack code**'>` 이런 텍스트를 입력하면 `img` 태그의 `onerror` 부분의 코드가 실제로 페이지 상에서 실행된다. 만약 저 텍스트가 서버에 저장된 후에 웹 페이지가 로딩될 때마다 서버로부터 불러와진다면, 해커는 다른 사용자가 이 페이지에 접속할 때 자신의 코드를 작동시킬 수 있다. 따라서 텍스트를 삽입하기 위한 의도라면 HTML 파싱을 거치지 않는 `textContext`를 사용해야 한다.

### `innerText`

- 해당 엘리먼트와 그 자손의 **렌더링된** 텍스트를 가져옴.
- `<br>`, 숨겨진 태그 등이 페이지 상에서 보이는 것과 똑같은 효과를 냄.
- 눈에 보이는 텍스트만 가져옴(`style`, `script` 태그의 내용은 가져오지 않음).
- 스타일을 고려함. == 리플로우 발생

### `textContent`

- 해당 엘리먼트 및 그 자손의 모든 텍스트 내용을 가져옴.
- `<br>` 등의 태그가 무시됨, `display: none;` 으로 설정된 텍스트도 가져옴.
- `style`, `script` 태그 안의 텍스트도 가져옴.
- 스타일을 고려하지 않음.

✅ 결론: `innerHTML`은 HTML 변환 과정이, `innerText`는 스타일 적용으로 인한 리플로우가 발생함. 단순히 요소 내에 텍스트를 삽입하거나 읽는 작업을 원하는 경우 `textContent`를 쓰는 것이 가장 합리적임.
