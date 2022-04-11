`outline` vs `border`

- `border`는 컴포넌트 안쪽 공간을 차지하고, `outline`은 컴포넌트 바깥쪽 공간을 차지한다.
- `border`를 사용했을 때 컴포넌트 안에 있는 요소들이 border의 두께만큼 밀리는 것이 싫다면 `outline`을 사용하면 된다.

`flex-wrap`

- 아이템이 플렉스 박스의 `width`를 넘으면 줄바꿈을 한다. 이 옵션을 주지 않으면 아이템이 많아짐에 따라 플렉스 박스를 빠져나간다.

네이버 CSS 속성 나열 순서 컨벤션:

1. `display`(표시)
2. `overflow`(넘침)
3. `float`(흐름)
4. `position`(위치)
5. `width/height`(크기)
6. `padding/margin`(간격)
7. `border`(테두리)
8. `background`(배경)
9. `color/font`(글꼴)
10. `animation`

`px` 사용을 고려해야 하는 이유

- px 단위 사용 시 브라우저의 폰트 크기를 무시하게 됨.
- 따라서 웹 접근성을 고려했을 때 좋지 않은 선택이다.
- `em`은 부모 요소의 크기를 기준으로 하므로 지나치게 사용할 경우 유지보수를 어렵게 만들 수 있다.
- 오직 `html` 요소의 폰트 사이즈를 기준으로 하는 `rem`이 훨씬 나은 대안이 될 수 있다.
- 다만, CSS에서 절대적으로 좋은 단위란 존재하지 않는다.

CSS에서 color 변수명 컨벤션 만들기

- 채도가 다른 색이 여럿 있을 경우 100부터 900까지 숫자를 지정해서 사용할 수 있다.
  - 예) `$gray-100`, `$gray-200`, ..., `$gray-900`
- 페이지 전체에서 사용하는 테마 칼라의 경우 `$primary`.

`font`

- 여러 속성들을 1줄로 나열할 수 있음.

```css
p {
  font: italic small-caps bold 12px/30px Georgia, serif;
}
```

- 속성은 순서대로:
  - font-style
  - font-variant
  - font-weight
  - font-size/line-height
  - font-family

`font-weigth`의 기본값은 `400`임.

`margin`의 인자:

- `margin: 1px`: 상, 하, 좌, 우 1px
- `margin: 1px 2px`: 상하 1px, 좌우 2px
- `margin: 1px 2px 1px`: 상 1px, 좌우 2px, 하 1px
- `margin: 1px 2px 3px 4px`: 상: 1px, 우: 2px, 하: 3px, 좌: 4px

`word-break`: 텍스트의 길이가 콘텐츠 박스보다 길 때 줄바꿈을 처리하는 방식을 지정하는 속성.

- `normal`(기본값)
  - 한중일: 오버플로우 지점에서 단어 단위로 끊을 수 있으면 끊되, 불가능하면 단어를 끊고 줄바꿈함.
  - 한중일 제외 언어: 무조건 단어 단위로 줄바꿈함(오버플로우 그대로 보여줌).
- `break-all`: 오버플로우가 발생하면 단어를 끊고 무조건 줄바꿈.
- `keep-all`
  - 한중일: 무조건 단어 단위로 줄바꿈함(오버플로우 그대로 보여줌
  - 한중일 제외 언어: `normal`과 동일.
- `break-world`
  - 한중일: `normal`과 동일.
  - 한중일 제외 언어: 오버플로우 지점에서 단어 단위로 끊을 수 있으면 끊되, 불가능하면 단어를 끊고 줄바꿈함.

`width` 속성 키워드 의미 알고 가기([Ref](https://www.daleseo.com/css-width/)).

- 상대 단위 사용 시 주의점
  - `margin`이 설정된 요소의 `width`를 부모 요소의 100%로 설정하면 부모 요소를 튀어나온다.
  - 어떤 요소의 실제 너비는 `width + margin-left + margin-right`이기 떄문.
- `auto`
  - 부모 요소로 결정되는 가용 너비에서 `margin-left + margin +right` 값을 뺀 값.
  - 예) 가용 너비가 100px인 부모 요소 안에서 `margin: 10px` 속성을 가진 요소에 `width: auto`를 적용하면 해당 요소의 `width`는 80px로 계산됨.
  - 즉, `width: auto`는 `width: calc(100% - 좌우마진)`과 동일함.
- `min-content`

  - 해당 요소가 담고 있는 컨텐츠를 기준으로 최소 너비를 정함.
  - 컨텐츠가 텍스트라면, 최대한 줄바꿈하여 `width`를 줄임.

- `max-content`

  - 해당 요소가 담고 있는 컨텐츠를 기준으로 최대 너비를 정함.
  - 컨텐츠가 텍스트라면, 최소한으로 줄바꿈하여 `width`를 늘림.
  - 특히, 텍스트의 배경색을 텍스트의 길이에 꼭 맞게 지정해주고 싶을 때 유용함.

- `fit-content`
  - `auto`와 `max-content`의 절충안.
  - 만약 가용 너비가 충분하다면 `max-content`를 적용함.
  - 그렇지 않다면 `auto`를 적용함.

`inherit`

- CSS에 존재하는 모든 속성의 키워드로 사용할 수 있음.
- 부모가 가지고 있는 해당 속성의 값을 그대로 사용함(상속).
