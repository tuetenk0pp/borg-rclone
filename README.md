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

3. Create a file `rclone.conf` with a valid remote config and place it here: `./data/.config/rclone/rclone.conf`

   ```bash
   docker run -it --rm --mount type=bind,src="$(pwd)/data/.config/rclone",target="/root/.config/rclone" ghcr.io/tuetenk0pp/borg-rclone bash -c "rclone config"
   ```

4. Add this to your Borgmatic config and replace `RCLONE_DEST` with the remote you configured in the previous step:

    ```yml
    after_everything:
        - rclone sync /mnt/borg-repository RCLONE_DEST -P --stats 1m -v 2>&1 && echo Completed actions.
    ```

5. Optional: If you are starting new, initialize the repository with the following command:

   ```bash
   # Borg 1.x
   docker compose run -it --rm borgmatic init --encryption repokey

   # Borg 2.x
   docker compose run -it --rm borgmatic rcreate --encryption repokey-aes-ocb
   ```

6. Use `docker compose up -d` to start the container and start taking backups :sunglasses: .

## Build

```bash
docker build . -t tuetenk0pp/borg-rclone:dev
```
