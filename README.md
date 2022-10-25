# WireGuard Client

## Preparation
1. Copy a peer configuration file from your WireGuard server.
1. Set the configuration file to `./config/wg0.conf`.
1. 1. Update `PUID` and `PGID` in `docker-compose.yml`. These IDs can be obtained by executing the following command.

    ```sh
    id ${USER}
    # output example
    # uid=1000(yuruto) gid=1000(yuruto) groups=1000(yuruto)
    # PUID = 1000 (= uid), PGID = 1000 (= gid)
    ```

## Build
Run the following command.

```sh
docker-compose build --no-cache
```

## Start
Enter the following command to start the container.

```sh
docker-compose up -d
```

## Check status/log
Execute the following command.

```sh
# show process status
docker-compose ps

# show log
docker-compose logs
```

