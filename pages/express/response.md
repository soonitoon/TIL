## setStatus vs status

> Sets the HTTP status for the response. It is a chainable alias of Node’s response.statusCode.
>
> [공식문서](http://expressjs.com/en/5x/api.html#res.status)

- `setStatus()`: 오직 상태코드만 보내고 클라이언트에게 응답을 종료.
- `status()`: 응답의 상태코드를 설정함. 메소드 체이닝으로 다른 응답을 계속 쓸 수 있음.

## Cookie

`res.clearCookie(cookieName)`으로 쿠기를 지울 수 있음. 메소드 체이닝으로 다른 응답 추가 가능.
