# 도커 이미지 다루기 이미지 빌드
## 도커 이미지 구조
- layer 구조

## Dockerfile 없이 이미지 생성
- 기존 컨테이너를 기반으로 새 이미지를 생성할 수 있다.
```shell
# docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]
# ubuntu 컨테이너의 현재 상태를 my_ubuntu:v1 이미지로 생성
$ docker commit -a jikim -m "First Commit" ubuntu my_ubutu:v1
```

## Dockerfile 이용하여 이미지 생성
- Dockerfile을 기반으로 새 이미지를 생성할 수 있다.
```dockerfile
FROM node:12-alpine
RUN apk add --no-cache python3 g++ make
WORKDIR /app
COPY /app
RUN yarn install --production
CMD ["node", "src/index.js"]
```

```shell
# docker build [OPTIONS] PATH
# ./ 디렉토리를 빌드 컨텍스트로 my_app:v1 이미지 빌드 (Dockerfile 이용)
$ docker build -t my_app:v1 ./

# ./ 디렉토리를 빌드 컨텍스트로 my_app:v1 이미지 빌드 (example/MyDockerfile 이용)
$ docker build -t my_app:v1 -f example/MyDockerfile ./
```

### 빌드 컨텍스트
- 도커 빌드 명령 수행 시 현재 디렉토리 (Current Working Directory)를 빌드 컨텍스트(Build Context)라고 한다.
- Dockerfile로부터 이미지 빌드에 필요한 정보를 도커 데몬에게 전달하기 위한 목적
```shell
=> [internal] load build definition from Dockerfile			0.0s
=> => transferring dockerfile: 190B					0.0s
=> [internal] load .dockerignore					0.0s
=> => transferring context: 2B						0.0s
=> [internal] load metadata for docker.io/library/node:12-alpine	1.0s
=> [1/5] FROM docker.io/library/node:12-alpine@sha256/XXXXXX		0.0s
=> [internal] load build context					0.1s
=> => transferring context: 4.61MB					0.1s
```

## .dockerignore
- .gitignore와 동일한 문법
- 특정 디렉토리 혹은 파일 목록을 빌드 컨텍스트에서 제외하기 위한 목적
```shell
# comment
*/temp*
*/*/temp*
temp?

*.md
!README.md
```
