# 도커 컨테이너 다루기 엔트리 포인트와 커맨드
## 엔트리포인트와 커맨드
- 실제 수행되는 컨테이너 명령어
	- `[Entrypoint] [Command]`
### 엔트리포인트 (Entrypoint)
- 도커 컨테이너 실행할 때 고정적으로 실행되는 스크립트 혹은 명령어
- 생략할 수 있으며, 생략될 경우 커맨드에 지정된 명령어로 수행

### 커맨드 (Command)
- 도커 컨테이너가 실행할 때 수행할 명령어 혹은 엔트리포인트에 지정된 명령어에 대한 인자값

## Dockerfile의 엔트리포인트와 커맨드
```
FROM node:12-alpine
RUN apk add --no-cache python g++ make
WORKDIR /app
COPY . .
RUN yarn install --production

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["node"]
```

## 도커 명령어의 엔트리포인트와 커맨드
- `docker run --entrypoint sh ubuntu:focal`
- `docker run --entrypoint echo ubuntu:focal hello world`



