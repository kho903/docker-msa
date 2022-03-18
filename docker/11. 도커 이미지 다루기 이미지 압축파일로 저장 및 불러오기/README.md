# 도커 이미지 다루기 이미지 압축파일로 저장 및 불러오기
## 이미지 압축파일로 저장
- 이미지를 tar 압축파일로 저장한다.
```shell
# docker save -o [OUTPUT-FILE] IMAGE
# ubuntu:focal 이미지를 ubuntu_focal.tar 압축 파일로 저장
$ docker save -o ubuntu_focal.tar ubuntu:focal
```

## 이미지 압축에서 불러오기
- 이미지를 tar 압축파일로부터 불러온다.
```shell
# docker load -i [INPUT-FILE]
# ubuntu_focal.tar 압축 파일에서 ubuntu:focal 이미지 불러오기
$ docker load -i ubuntu_focal.tar
```
