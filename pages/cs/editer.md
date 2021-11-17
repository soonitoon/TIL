## VScode prettier 익스텐션 & 타입스크립트

vscode에서 타입스크립트 프리티어 포멧팅 안 먹힐 때: 설정 JSON 파일 열어서 다음 설정 추가.

```json
"[typescript]": { "editor.defaultFormatter": "esbenp.prettier-vscode" },
"[typescriptreact]": { "editor.defaultFormatter": "esbenp.prettier-vscode" }
```
