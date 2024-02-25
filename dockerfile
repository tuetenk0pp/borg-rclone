FROM alpine:3.19.1

RUN apk add --no-cache borgbackup=1.2.7-r0

RUN apk add --no-cache rclone=1.65.0-r0

COPY ./backup.sh /opt/backup.sh

RUN chmod +x /opt/backup.sh

# TODO: restore.sh müsste es auch geben, vieleicht in docker run als Argument übergeben; entweder backup oder restore

ENTRYPOINT [ "/opt/backup.sh" ]