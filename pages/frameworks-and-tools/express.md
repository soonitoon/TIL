## setStatus vs status

> Sets the HTTP status for the response. It is a chainable alias of Node’s response.statusCode.
>
> [공식문서](http://expressjs.com/en/5x/api.html#res.status)

- `setStatus()`: 오직 상태코드만 보내고 클라이언트에게 응답을 종료.
- `status()`: 응답의 상태코드를 설정함. 메소드 체이닝으로 다른 응답을 계속 쓸 수 있음.

## Cookie

`res.clearCookie(cookieName)`으로 쿠기를 지울 수 있음. 메소드 체이닝으로 다른 응답 추가 가능.

## middlewares

- `req.body` 에서 `json` 읽어오려면 미들웨어로 `app.use(express.json())` 사용.
- `bodyparse` 는 이제 `express`에 포함되어 있기 때문에 추가로 설치하지 말 것.

## express-generator

`$ sudo npm i -g express-generator`

`$ npx express-generator`

익스프레스 서버 기본 틀을 자동으로 만들어줌.
