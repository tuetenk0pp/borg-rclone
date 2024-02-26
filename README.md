# borg-rclone

## Description

This repository extends the Docker image for [Borgmatic](https://github.com/borgmatic-collective/docker-borgmatic).
It adds [rclone](https://rclone.org/) to the image to make it easy to sync backups to remotes other than ssh.

## Usage

> [!IMPORTANT]
> Before you start, head over to the [Borgmatic](https://github.com/borgmatic-collective/docker-borgmatic) repository to find out how to use the image.

1. Copy `.env.template` to `.env` and `.env.override.template` to `.env.override` and modify them to match your setup.
2. Place your existing Borgmatic config in `./data/borgmatic.d` or create a new one with this command:

   ```bash
   docker run -it --rm --mount type=bind,src="$(pwd)/data/borgmatic.d",target="/etc/borgmatic.d" ghcr.io/tuetenk0pp/borg-rclone bash -c "borgmatic config generate -d /etc/borgmatic.d/config.yaml"
   ```

3. Add this to your Borgmatic config:

    ```yml
    after_everything:
        - "rclone $VOLUME_TARGET $RCLONE_DEST"
    ```

4. Create a file `rclone.conf` with a valid remote config and place it here: `./data/.config/rclone/rclone.conf`

   ```bash
   docker run -it --rm --mount type=bind,src="$(pwd)/data/.config/rclone",target="/root/.config/rclone" ghcr.io/tuetenk0pp/borg-rclone bash -c "rclone config"
   ```

5. Use `docker compose up -d` to start the container. Note that Docker will make use of the `docker-compose.override.yml` in addition to the original `docker-compose.yml`.

## Build

```bash
docker build . -t tuetenk0pp/borg-rclone:dev
```
