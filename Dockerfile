FROM alpine:latest AS download

ENV AIR_VERSION=1.52.3

RUN apk add --no-cache curl \
    && curl -sSfL https://github.com/cosmtrek/air/releases/download/v$AIR_VERSION/air\_$AIR_VERSION\_linux_amd64.tar.gz | tar -xz  \
    && mv air /usr/bin/air  \
    && air -v 

FROM golang:1.23.1-alpine AS docker-image

ENV AIR_VERSION=1.52.3

COPY --from=download /usr/bin/air /usr/bin/air

WORKDIR /app

COPY .air.toml ../air/