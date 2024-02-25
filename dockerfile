FROM alpine:3.19.1

RUN apk add --no-cache borgbackup=1.2.7-r0

RUN apk add --no-cache rclone=1.65.0-r0

COPY ./entry.sh /entry.sh

RUN chmod +x /entry.sh

VOLUME [ "/mnt/source", "/mnt/repo", "/app/config", "/app/cache", "/app/data"]

ENTRYPOINT [ "/entry.sh" ]