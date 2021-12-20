## 깃헙 페이지 404 오류 대처

`GitHub Pages` 배포 후 브랜치와 경로에 아무런 문제가 없는데도 404가 뜨는 경우가 종종 있음.

- 20분 이상 경과,
- 강력 새로고침 이후에도 `404`가 뜨는 경우,

```sh
$ git commit --allow-empty -m "Trigger rebuild"
$ git push
```

명령어를 실행하면 대부분의 경우 해결됨.

## Git 명령어

### `$ git checkout -`

브랜치명 전체를 입력하지 않아도 체크아웃 하기 바로 전 브랜치로 이동함. 두 브랜치 사이를 왔다갔다 할 때 유용하게 사용할 수 있음.