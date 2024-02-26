# borg-rclone

## run

1. Place your Borgmatic config in `./data/borgmatic.d` or create a new one:

   ```bash
   docker run -it --rm --mount type=bind,src="$(pwd)/data/borgmatic.d",target="/etc/borgmatic.d" ghcr.io/tuetenk0pp/borg-rclone bash -c "borgmatic config generate -d /etc/borgmatic.d/config.yaml"
   ```

2. Add this to your Borgmatic config:

    ```yml
    after_everything:
        - "rclone $VOLUME_TARGET $RCLONE_DEST"
    ```

3. Create a file `rclone.conf` with a valid remote config and place it here: `./data/.config/rclone/rclone.conf`

   ```bash
   docker run -it --rm --mount type=bind,src="$(pwd)/data/.config/rclone",target="/root/.config/rclone" ghcr.io/tuetenk0pp/borg-rclone bash -c "rclone config"
   ```

4. `docker compose up -d`

## build

```bash
docker build . -t tuetenk0pp/borg-rclone:dev
```
