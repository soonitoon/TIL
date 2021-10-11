## `sign()`

> `payload` could be an object literal, buffer or string representing valid JSON.
>
> [NPM 공식문서](https://www.npmjs.com/package/jsonwebtoken)

jwt에 건네주는 payload는 반드시 오브젝트거나 `string` 형태의 JSON이어야 함. 단일 값을 전달하고자 할 경우 단일 속성만을 가진 오브젝트를 건네야 함. 문자열을 건넬 수는 없음.
