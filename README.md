# borg-rclone

## run

1. Add this to your Borgmatic config:

    ```yml
    after_everything:
        - "rclone $VOLUME_TARGET $RCLONE_DEST"
    ```

2. Create a file `rclone.conf` with a valid remote config and place it here: `./data/.config/rclone/rclone.conf`

   ```bash
   docker run -it --rm --mount type=bind,src="$(pwd)/data/.config/rclone",target="/root/.config/rclone" ghcr.io/tuetenk0pp/borg-rclone bash -c "rclone config"
   ```

3. `docker compose up -d`

## build

```bash
docker build . -t tuetenk0pp/borg-rclone:dev
```
