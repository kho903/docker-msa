# 도커 컨테이너 다루기 : 명령어 실행
## docker exec
- 실행중인 컨테이너에 명령어를 실행
```
$ docker exec [container] [command]

# my-nginx 컨테이너에 Bash 쉘로 접속하기
$ docker exec -i -t my-nginx bash

# my-nginx 컨테이너에 환경변수 확인하기
$ docker exec my-nginx env
```
