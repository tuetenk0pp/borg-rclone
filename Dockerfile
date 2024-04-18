FROM ghcr.io/borgmatic-collective/borgmatic:1.8.10
LABEL maintainer='github.com/tuetenk0pp'

VOLUME /root/.config/rclone

RUN apk add --update --no-cache \
    rclone \
    && rm -rf \
    /var/cache/apk/* \
    /.cache


