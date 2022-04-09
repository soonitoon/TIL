리액트 후크의 위치

- React Hook를 사용할 때는 컴포넌트 함수 최상단에 작성하는 것이 좋다.
- React에서 후크는 반드시 실행되어야 한다는 원칙을 가지고 있으므로 실수로 인해 조건부로 실행되는 일을 방지할 수 있다.

`react-hot-loader`

- 리액트 어플리케이션을 개발하는 과정에서 어플리케이션이 무거워지면 저장 후 새로고침에 드는 시간이 길어진다.
- 또한 styled-component나 emotion 등을 통해 js 내부에 스타일 코드를 작성할 경우, 스타일 코드를 수정할 때마다 새로고침이 되는 것도 번거롭다.
- 페이지 전체가 새로고침되는 것이 아니라 어플리케이션의 state를 유지한 채 변경이 일어난 부분만 바꿔주는 툴이 `react-hot-loader`다.

`React.lazy`

- 동적 `import`를 사용해서 리액트 컴포넌트를 불러올 수 있는 함수.
- `lazy` 컴포넌트는 `Suspense` 컴포넌트 하위에서 사용할 수 있음.
  - `Suspense` 컴포넌트에는 `fallback` 속성을 통해 하위 컴포넌트를 불러오는 동안 보여줄 예비 컴포넌트를 전달할 수 있음.
  - 하나의 `Suspense` 컴포넌트는 여러 `lazy` 컴포넌트를 자식으로 가질 수 있음.

```typescript
import React, { Suspense } from "react";
import Loading from "./components/Loading";
const Lazy = React.lazy(() => import("./components/LazyComponent"));

export default function App() {
  return (
    <div className="App">
      <Suspense fallback={Loading}>
        <Lazy />
      </Suspense>
    </div>
  );
}
```

`react-hook-form`

- 특정 필드만 초기화하고자 할 때 `resetField(fieldName)` API로 구현할 수 있다.

`yup`

- 메소드 체이닝으로 입력값 검증할 때 각 검증 메소드에 인자로 해당 검증을 통과하지 못했을 때 출력할 에러메시지를 줄 수 있음.

```javascript
const schema = yup
  .object()
  .shape({
    email: yup
      .string()
      .email("이메일을 양식을 확인해주세요")
      .required("이메일을 입력해주세요"),
    password: yup.string().required("비밀번호를 입력해주세요"),
    isSaveId: yup.boolean(),
    isAutoLogin: yup.boolean(),
  })
  .required();
```
