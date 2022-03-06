## outline vs border

`border`는 컴포넌트 안쪽 공간을 차지하고, `outline`은 컴포넌트 바깥쪽 공간을 차지한다. `border`를 사용했을 때 컴포넌트 안에 있는 요소들이 경계선의 두께만큼 밀린다면 `outline`을 사용하면 해결된다.

## flexbox

### flex-wrap

`flex-wrap`: 아이템이 플렉스 박스의 `width`를 넘으면 줄바꿈을 한다. 이 옵션을 주지 않으면 아이템이 많아짐에 따라 플렉스 박스를 빠져나간다.

### align-items

플렉스 박스 안의 아이템들을 축을 기준으로 정렬하는 방식.

## 네이버 CSS 속성 나열 순서 컨벤션

1. display(표시)
2. overflow(넘침)
3. float(흐름)
4. position(위치)
5. width/height(크기)
6. padding/margin(간격)
7. border(테두리)
8. background(배경)
9. color/font(글꼴)
10. animation

## px 사용을 고려해야 하는 이유

px 단위 사용 시 브라우저의 폰트 크기를 무시하게 됨. 웹 접근성을 고려했을 때 좋지 않은 선택이다. `em`은 부모 요소의 크기를 기준으로 하므로 지나치게 사용할 경우 유지보수를 어렵게 만들 수 있다. 오직 `html` 요소의 폰트 사이즈를 기준으로 하는 `rem`이 훨씬 나은 대안이 될 수 있다. 다만, CSS에서 절대적으로 좋은 단위는 존재하지 않는다.

## CSS에서 칼라 변수명 만들기

- 명도가 다른 같은 색이 여럿 있을 경우 100부터 900까지 숫자를 지정해서 사용함.
- 홈페이지에서 두루두루 쓰이는 테마 칼라의 경우 `primary` 이름 사용.

## font

여러 속성들을 1줄로 나열 가능.

```css
p {
  font: italic small-caps bold 12px/30px Georgia, serif;
}
```

속성은 순서대로:

- font-style
- font-variant
- font-weight
- font-size/line-height
- font-family
