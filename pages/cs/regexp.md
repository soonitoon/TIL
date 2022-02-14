# 정규표현식 정리

- `(?!pattern)`: Nagative lookahead. 해당 패턴을 매칭에서 제외한다.
- `pattern1|pattern2`: 정규식 OR 연산자.
- `pattern{n, }`: 해당 패턴이 n번 이상 반복될 경우 매칭됨. 정규식 수량자의 일종.
- `pattern{n}`: 해당 패턴이 정확히 n번 반복될 때에만 매칭됨.
- `pattern*`: 모든 반복되는 패턴을 찾음(반복 횟수는 상관 없음).
- `pattern1(pattern2)`

  - 캡처.
  - `pattern1(pattern2)`와 `pattern1patern2`의 매칭 결과는 같다. 하지만 자바스크립트에서 `match` 메소드 사용시 반환 결과는 다르다.
  - 캡처를 사용하면 캡처 안에 포함된 서브문자열이 반환되는 배열의 두 번째 요소로 포함된다.

    ```javascript
    const string = "hello";
    const regex = /hello/;
    const regexWithCapture = /(hel)lo/;

    console.log(string.match(regex));
    // [ 'hello', index: 0, input: 'hello', groups: undefined ]

    console.log(string.match(regexWithCapture));
    // [ 'hello', 'hel', index: 0, input: 'hello', groups: undefined ]
    ```

    - `pattern1(?<name>pattern2)`와 같은 방법으로 캡처 그룹에 그룹명을 붙일 수 있다.
    - `match` 메소드가 반환하는 배열의 속성인 `groups` 객체를 참조하여 설정한 캡처 그룹 이름으로 서브 스트링에 접근할 수 있다.

    ```javascript
    const string = "hello";
    const regexWithCaptureGroupName = /(?<first>hel)(?<second>lo)/;
    const result = string.match(regexWithCaptureGroupName).groups.first;

    console.log(result);
    // hel
    ```
