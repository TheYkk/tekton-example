FROM golang:1.14-alpine AS build-env
WORKDIR /go/src/app

ADD main.go main_test.go  /go/src/app/
ADD ./ci  /go/src/app/ci

RUN ./ci/build

FROM alpine:3.12
WORKDIR /app
COPY --from=build-env /go/src/app/app .
ENTRYPOINT [ "./app" ]