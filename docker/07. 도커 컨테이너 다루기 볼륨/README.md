# 도커 컨테이너 다루기 - 볼륨
## 호스트 볼륨
- 호스트의 디렉토리를 컨테이너의 특정 경로에 마운트한다.
```
# 호스트의 /opt/html 디렉토리를 nginx의 웹 루트 디렉토리로 마운트
$ docker run -d \
 --name nginx \
 -v /opt/html:/usr/share/nginx/html \
 nginx
```

## 볼륨 컨테이너
- 틀정 컨테이너의 볼륨 마운트를 공유할 수 있다.
```
$ docker run -d \
 --name my-volume \
 -it \
 -v /opt/html:/usr/share/nginx/html \
 ubuntu:focal

# my-volume 컨테이너의 볼륨을 공유
$ docker run -d \
 --name nginx \
 --volumes-from my-volume \
 nginx
```

## 도커 볼륨
- 도커가 제공하는 볼륨 관리 기능을 활용하여 데이터를 보존한다.
- 기본적으로 `/var/lib/docker/volumes/${volume-name}/_data` 에 데이터가 저장된다.

```
# web-volume 도커 볼륨 생성
$ docker volume create --name db

# 도커의 web-volume 볼륨을 nginx 의 웹 루트 디렉토리로 마운트
$ docker run -d \
 --name fastcampus-mysql \
 -v db:/var/lib/mysql \
 -p 3306:3306 \
 mysql:5.7
```

## 읽기 전용 볼륨 연결
- 볼륨 연결 설정에 :ro 옵션을 통해 읽기 전용 마운트 옵션을 설정할 수 있다.
```
# 도커의 web-volume 볼륨을 nginx의 웹 루트 디렉토리로 읽기 전용 마운트
$ docker run -d \
 --name nginx \
 -v web-volume:/usr/share/nginx/html:ro \
 nginx
```
