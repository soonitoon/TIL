## `hash()` vs `hashSync()`

> Why is async mode recommended over sync mode?
> If you are using bcrypt on a simple script, using the sync mode is perfectly fine. However, if you are using bcrypt on a server, the async mode is recommended. This is because the hashing done by bcrypt is CPU intensive, so the sync version will block the event loop and prevent your application from servicing any other inbound requests or events. The async version uses a thread pool which does not block the main event loop.
>
> [NPM 문서](https://www.npmjs.com/package/bcrypt)

공식문서에 따르면, 서버에서 `hash()`, `compare()` 사용 시 비동기 처리를 권장함. 두 작업은 CPU 자원을 많이 소모하므로 `hashSync()`, `compareSync()`를 통해 동기 처리로 구현하면 서버가 다른 이벤트에 대응하지 못할 수도 있음.

```javascript
const hash = hashSync(password, salt); // ⛔️ 서버 작업에서 권장하지 않음

const hash await hash(password, salt); // ✅ 권장
```
