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

`<template>`([Ref](https://developer.mozilla.org/ko/docs/Web/HTML/Element/template))
