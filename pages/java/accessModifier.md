## 패키지

- 관련 있는 클래스 파일을 저장하는 디렉토리

## 접근 지정자

- `private`
- `protected`
- `public`
- `default` (접근 지정자 생략)

|  지정자   | 동일 패키지 | 자식 클래스 | 모든 클래스 |
| :-------: | :---------: | :---------: | :---------: |
|  private  |     ❌      |     ❌      |     ❌      |
|  default  |     ✅      |     ❌      |     ❌      |
| protected |     ✅      |     ✅      |     ❌      |
|  public   |     ✅      |     ✅      |     ✅      |
