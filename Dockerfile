FROM alpine:3.19.1

RUN apk add --no-cache \
    borgbackup \
    rclone

COPY ./entry.sh /entry.sh

RUN chmod +x /entry.sh

VOLUME [ "/mnt/source", "/mnt/repo", "/app/config", "/app/cache", "/app/data"]

ENTRYPOINT [ "/entry.sh" ]