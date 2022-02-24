# 도커 컨테이너 다루기 : 네트워크
## 도커 네트워크 구조
- veth: virtual eth
- docker0: 도커 엔진에 의해 기본 생성되는 브릿지 네트워크 => veth와 eth간 다리 역할

## 컨테이너 포트 노출
- 컨테이너의 포트를 호스트의 IP:PORT 와 연결하여 서비스를 노출한다.
```
$ docker run -p [HOST IP:PORT]:[CONTAINER PORT] [container]

# nginx 컨테이너의 80번 포트를 호스트 모든 IP의 80번 포트와 연결하여 실행
$ docker run -d -p 80:80 nginx

# nginx 컨테이너의 80번 포트를 호스트 127.0.0.1 IP의 80번 포트와 연결하여 실행
$ docker run -d -p 127.0.0.1:80:80 nginx

# nginx 컨테이너의 80번 포트를 호스트의 사용 가능한 포트와 연결하여 실행
$ docker run -d -p 80 nginx
```

## Expose vs Publish
```
# expose 옵션은 그저 문서화 용도
$ docker run -d --expose 80 nginx

# publish 옵션은 실제 포트를 바인딩
$ docker run -d -p 80 nginx
```

## 도커 네트워크 드라이버
- Single Host Networking
	- Driver 
		- bridge
			- docker0(default)
			- user defined
		- host
		- none
- Multi Host Networking
	- Driver
		- overlay
