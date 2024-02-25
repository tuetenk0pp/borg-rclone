# borg-rclone

## run

```bash
docker run --env-file .env --mount .borg-rclone:/app --mount /mnt/user:/mnt/source:ro --mount /mnt/backups:/mnt/repo tuetenk0pp/borg-rclone:dev 
```

## compose

```compose
# TODO
```

## build

```bash
docker build . -t tuetenk0pp/borg-rclone:dev
```
