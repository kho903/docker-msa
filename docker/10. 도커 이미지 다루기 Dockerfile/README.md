# 도커 이미지 다루기 Dockerfile 문법
- https://docs.docker.com/engine/reference/builder/
```dockerfile
FROM node: 12-alpine
RUN apk add --no-cache python3 g++ make
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]
```


