#!/usr/bin/env sh

docker network create --driver=bridge jihun

docker run -d --network=jihun --net-alias=hello nginx
docker run -d --network=jihun --net-alias=grafana grafana/grafana

