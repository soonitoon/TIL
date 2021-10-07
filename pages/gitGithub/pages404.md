`GitHub Pages` 배포 후 브랜치와 경로에 아무런 문제가 없는데도 404가 뜨는 경우가 종종 있음.

- 20분 이상 경과,
- 강력 새로고침 이후에도 `404`가 뜨는 경우,

```sh
$ git commit --allow-empty -m "Trigger rebuild"
$ git push
```

명령어를 실행하면 대부분의 경우 해결됨.
