`<datalist>`

- `input` 태그에 미리 정해진 옵션을 띄워줄 수 있는 태그.
- `input`의 `list` 속성에 `datalist`의 `id`를 넣으면 연결된다.

코드 예시:

```html
<label for="browser">Choose your browser from the list:</label>
<input list="browsers" name="browser" id="browser" />

<datalist id="browsers">
  <option value="Edge"></option>
  <option value="Firefox"></option>
  <option value="Chrome"></option>
  <option value="Opera"></option>
  <option value="Safari"></option>
</datalist>
```

`<template>`

[Ref](https://developer.mozilla.org/ko/docs/Web/HTML/Element/template)

- 나중에 사용하기 위해 미리 만들어둔 HTML 요소의 템플릿
- `<template>` 안의 요소들은 렌더링 되지 않는다.
- 나중에 자바스크립트를 통해 해당 템플릿 요소를 불러와 데이터를 집어넣은 뒤, HTML 상의 원하는 위치에 삽입할 수 있다.

`<em>`

[Ref](https://www.w3schools.com/tags/tag_em.asp)

- 특정 텍스트를 강조하고 싶을 때 사용함.
- `em` 안에 있는 텍스트는 대부분의 브라우저에서 _이텔릭체로_ 표시됨.
- 보이스 오버는 `em` 태그를 만나면 그 부분을 강조해서 읽음.
