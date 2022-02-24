# 도커 컨테이너 다루기 - 환경 변수
## 환경변수 주입
- docker run -i -t -e 환경변수=이름 ubuntu:focal bash

## 환경변수 파일 주입
sample.env
```
MY_HOST=helloworld.com
MY_VAR=123
MY_VAR2=456
```
- docker run -i -t --env-file ./sample.env ubuntu:focal env

