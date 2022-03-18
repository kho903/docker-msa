# 도커 컨테이너 다루기 로그
## 로그 확인하기
```shell
# 전체 로그 확인
$ docker logs [container]

# 마지막 로그 10줄 확인
$ docker logs --tail 10 [container]

# 실시간 로그 스트림 확인
$ docker logs -f [container]

# 로그마다 타임스탬프 표시
$ docker logs -f -t [container]
```

## 호스트 운영체제의 로그 저장 경로
```shell
$ cat /var/lib/docker/containers/${CONTAINER_ID}/${CONTAINER_ID}-json.log
```

## 로그 용량 제한하기
- 컨테이너 단위로 로그 용량 제한을 할 수 있지만, 도커 엔진에서 기본 설정을 진행할 수도 있다. (운영환경에서 필수 설정)
```shell
# 한 로그 파일 당 최대 크기를 3MB로 제한하고, 최대 로그 파일 3개로 로테이팅
$ docker run \
 -d \
 --log-driver=json-file \
 --log-opt max-size=3m \
 --log-opt max-file=5 \
 nginx
```
