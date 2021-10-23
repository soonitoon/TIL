## lerna

모노레포 관리 툴.

`npx lerna init`으로 lerna 초기화(`lerna.json` 파일 생성.).

### `lerna.json` 옵션

- `private`: `true` npm 배포 안 함.

- `workspaces`: 패키지 폴더가 위치할 경로 선택(일반적으로는 `packages/*` 사용.).

`$ lerna run test`: 모든 패키지의 `test` 스크립트 실행.

`$ lerna run test --scope=@sooni/common`

`test` 스크립트를 실행할 패키지의 범위 설정 가능.

`$ lerna run test --scope={@sooni/common,@sooni/server}`

중괄호로 여러 패키지 지정 가능.

`$ lerna version`

1. lerna가 변화가 생긴 패키지의 버전을 자동으로 업그레이드하고(`package.json` 에도 자동으로 반영),
2. 해당 버전의 커밋과 태그를 만들고,
3. 리모트 저장소에 푸쉬함.

자동 지정되는 버전이 마음에 안 들면 직접 지정도 가능.

- `$ lerna version 1.0.1`
- `$ lerna version patch`

사용할 수 있는 키워드는 다음과 같음.

- `major`
- `minor`
- `patch`
- `permajor`
- `preminor`
- `prepatch`
- `prerelease`

`$ lerna version --yes`

버전을 올릴 때 프롬프트가 물어보지 않음. CI 자동화할 때 필수 옵션.

`$ lerna version --conventional-commits`

버전을 올릴 때 [conventional commits](https://www.conventionalcommits.org/ko/v1.0.0/) 규칙에 따라 체인지 로그 파일을 프로젝트 루트 경로에 하나, 각 패키지별 폴더 안에 하나씩 만들어줌.

## yarn

`$ yarn add -D package-name`

`package-name`을 데브 디펜던시로 설치.

`$ yarn add -W package-name`

== `$yarn add --ignore-workspace-root-check package-name`

패키지를 설치할 때 지정한 워크스페이스 경로를 무시하고 패키지 설치(`lerna` 등의 도구를 프로젝트 최상단에 설치할 경우 사용)

## yarn workspace

`$ yarn init -y`로 `package.json` 생성.

프로젝트 루트 경로에 있는 `package.json`

```json
{
  "workspaces": [
    "packages/*"
  ],
  "private": "true",
  ...
}
```

이렇게 하면 프로젝트 폴더 내의 `packages` 라는 폴더에 여러 모듈을 모노레포로 관리할 수 있음.

NPM 배포를 원하지 않는다면 `private` 를 `true`로 설정.

```
sooni/
├─ packages/
│  ├─ common/
│  │  ├─ index.js
│  │  ├─ package.json
│  ├─ server/
│  │  ├─ index.js
│  │  ├─ package.json
├─ package.json

```

`packages` 폴더 내부에 모듈별로 폴더를 만든다.

그 안에서 전부 `$ yarn init` 을 실행.

`package.json` 안의 `name`에 `@패키지이름/`을 추가해줌.

```json
{
  "name": "@sooni/server",
  "version": "1.0.0",
  "main": "index.js",
  "license": "MIT",
  "dependencies": {
    "@sooni/common": "1.0.0",
  ...
}

```

이제 `$ yarn install` 명령을 실행하면 다른 모듈을 `import` 할 때 상대경로를 쓰지 않고 다른 경로에 있는 모듈을 마치 npm 모듈처럼 사용이 가능함.

사용하고자 하는 모듈을 `dependencies` 안에 추가하고 `$ yarn install` 을 실행하면 프로젝트 루트 디렉토리의 `node_modules` 폴더에 링크를 생성.

이후 `import module_name from "@sooni/common";` 과 같이 사용가능.

이제 각 모듈 내부에서 의존성 모듈을 설치하면 전부 루트 디렉토리의 `node_modules` 폴더 안에 설치됨.

동일한 패키지를 여러 모듈에서 사용하는 경우에 관리가 편함.

기존에 설치한 모듈을 다른 버전으로 설치하면 그 버전이 루트 경로에 설치되고, 기존 버전은 기존 모듈을 사용했던 디렉토리 내부의 `node_modules` 폴더 안에 자동으로 설치됨.

만약 같은 모듈을 다른 버전으로 각각의 모듈 디렉토리에서 사용하다가 버전을 통일하면 어떻게 될까?

=> yarn에서 자동으로 통일된 버전을 루트 `node_modules` 에 설치하고, 각 모듈 디렉토리 안에 존재했던 다른 버전들을 모두 삭제함.
