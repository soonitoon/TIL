## 로그인 실패 시 전송하는 상태코드

> **401 Unauthorized** Similar to 403 Forbidden, but specifically for use when authentication is required and has failed or has not yet been provided. The response must include a WWW-Authenticate header field containing a challenge applicable to the requested resource.

401을 쓰자. `403`과는 조금 다른 의미로, 인증이 요구되거나 실패했거나, 아직 제공되지 않은 경우를 명시할 수 있다.
