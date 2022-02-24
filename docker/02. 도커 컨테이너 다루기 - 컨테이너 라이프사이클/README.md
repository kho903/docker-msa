# 도커 컨테이너 다루기 컨테이너 라이프 사이클
## 컨테이너 시작
- 도커 create / run 명령어 모두 이미지가 없을 경우 자동으로 pull을 먼저 수행하여 이미지를 다운로드 받음
- 컨테이너 생성
	- `docker create [image]`
- 컨테이너 시작
	- `docker start [container]`
- 컨테이너 생성 및 시작
	- `docker run [image]`

## 컨테이너 시작 주요 옵션
```
docker run \
  -i \				# 호스트의 표준 입력을 컨테이너와 연결 (interactive)
  -t \				# TTY 할당
  --rm \			# 컨테이너 실행 종료 후 자동 삭제
  -d \				# 백그라운드 모드로 실행 (detached)
  --name hello-word \ 		# 컨테이너 이름 지정
  -p 80:80 \			# 호스트 - 컨테이너 간 포트 바인딩
  -v /opt/example:/example \	# 호스트 - 컨테이너 간 볼륨 바인딩
  [이름]/hello-word:latest \	# 실행할 이미지
  my-command			# 컨테이너 내에서 실행할 명령어
```

## 컨테이너 상태 확인
- 실행중인 컨테이너 상태 확인
	- `docker ps`
- 컨테이너 상세 정보 확인
	- `docker inspect [container]`
- 전체 컨테이너 상태 확인
	- `docker ps -a`

## 컨테이너 일시중지 및 재개
- 컨테이너 일시중지
	- `docker pause [container]`
- 컨테이너 재개
	- `docker unpause [container]`

## 컨테이너 종료
- 컨테이너 종료 (SIGTERM 시그널 전달)
	- `docker stop [container]`
- 모든 컨테이너 종료
	- `docker stop ${docker ps -a -q)`
- 컨테이너 강제 종료 (SIGKILL 시그널 전달)
	- `docker kill [container]`

## 컨테이너 삭제
- 컨테이너 삭제 (실행중인 컨테이너 불가)
	- `docker rm [container]`
- 컨테이너 실행 종료 후 자동 삭제
	- `docker run --rm ...`
- 컨테이너 강제 종료 후 삭제 (SIGKILL 시그널 전달)
	- `docker rm -f [container]`
- 중지된 모든 컨테이너 삭제
	- `docker container prune`

