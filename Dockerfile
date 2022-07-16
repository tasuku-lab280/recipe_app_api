# 参照: https://zenn.dev/tatsurom/articles/golang-docker-environment

FROM golang:1.18.4-alpine3.16 as dev

ENV ROOT=/go/src/app
ENV CGO_ENABLED 0
WORKDIR ${ROOT}

RUN apk update && apk add git
COPY go.mod go.sum ./
RUN go mod download
EXPOSE 8080

RUN go install github.com/cosmtrek/air@latest
CMD ["air"]
