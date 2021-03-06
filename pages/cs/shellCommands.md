## 일반 bash 커맨드

`$ !!` 이전 명령을 그대로 실행함. => `sudo` 권한 누락시 유용하게 사용 가능.

`$ cp 복사대상 붙여넣을경로` 명령으로 copy & paste 할 수 있음.

## autojump 클린

간혹 오토점프가 원하는 대로 동작하지 않을 때 macOS에서는 `$ rm ~/Library/autojump/autojump.txt` 명령어로 저장 파일을 지우거나 직접 수정하면 됨.

## sed

찾을 스트링을 정규표현식으로 반드시 `/somestring/g` 처럼 `g` 옵션을 붙여줘야 모든 스트링이 바뀜.

쉘 스크립팅에서 특정 파일의 특정 문자 치환하기

```shell
$ sed -i 'backup-file-name' 'regex' 'file-name'
```

macOS에서는 `-i` 옵션 사용 시 백업파일 이름을 반드시 인자로 넘겨야함. 백업 파일을 만들기 싫으면 빈 문자열을 넘기면 됨.

```shell
$ cat hello.txt # hello
$ sed -i '' 's/hello/goodbye/g' hello.txt
$ cat hello.txt # goodbye
```

## Vim 커멘드

- 아래로 천천히 스크롤: `ctrl + e`
- 위로 천천히 스크롤: `ctrl + y`
- 아래로 빨리 스크롤: `ctrl + f`
- 위로 빨리 스크롤: `ctrl + b`
- 문장 마지막에 삽입: `shift + a`
- 원하는 라인으로 점프: `lineNum + gg`
- Vim에서 멀티라인-커서 사용하기
  - `ctrl + v`로 비주얼 블럭 모드 진입
  - 원하는 라인까지 스크롤
  - `shift + i + 삽입텍스트 + ESC`

## Vim 플러그인 커맨드

- (NERDTree) 트리 전체 새로고침: `shift + r`
- {NERDTree) 세로 분할 열기: `s`

## bach scripting

- bash 스크립트에서는 모든 변수가 글로벌 변수임(심지어 함수 스코프 안에 있는 변수들도).
- 만약 지역 변수를 사용하고 싶다면 변수 선언문 앞에 `local` 키워드를 붙이면 됨.

## bash 스크립트에서 함수 만들기

```sh
function nameOfFunc {
  echo $1
}
```

`function` 키워드로 만든다. 매개변수의 경우 `$1`부터 숫자 올려가면서 사용.

## bash에서 replace하기

### replace

```sh
text='hello hello hello'
echo "${text/h/H}" # Hello hello hello
```

### replace all

```sh
text='hello hello hello'
echo "${text//h/H}" # Hello Hello Hello
```
