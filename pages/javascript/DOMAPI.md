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
