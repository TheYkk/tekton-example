FROM golang:1.14-alpine AS build-env
WORKDIR /go/src/app

ADD main.go main_test.go /go/src/app/

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-extldflags "-static"' -o app .

FROM alpine:3.12
WORKDIR /app
COPY --from=build-env /go/src/app/app .
ENTRYPOINT [ "./app" ]