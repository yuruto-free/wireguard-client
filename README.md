# WireGuard Client

## Preparation
1. Copy a peer configuration file from your WireGuard server.
1. Set the configuration file to `./config/wg0.conf`.
1. Add the following configuration in Interface section to `./config/wg0.conf`. See `./sample.wg0` for details.

    ```sh
    PostUp = iptables -t nat -A POSTROUTING -d 10.0.16.0/24 -j MASQUERADE
    PostDown = iptables -t nat -D POSTROUTING -d 10.0.16.0/24 -j MASQUERADE
    ```

1. Update `PUID` and `PGID` in `docker-compose.yml`. These IDs can be obtained by executing the following command.

    ```sh
    id ${USER}
    # output example
    # uid=1000(yuruto) gid=1000(yuruto) groups=1000(yuruto)
    # PUID = 1000 (= uid), PGID = 1000 (= gid)
    ```

1. Copy the `.yml` file as `docker-compose.yml` to match the network mode. The network mode is listed below.
    * host: `host-mode.yml`
    * bridge: `bridge-mode.yml`

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

## FAQ
If the container does not start on your Raspberry Pi, access to the [libseccomp](https://ftp.debian.org/debian/pool/main/libs/libseccomp/) and install the following library.

```sh
# ========
# Examples
# ========
# armhf/armv7l
wget https://ftp.debian.org/debian/pool/main/libs/libseccomp/libseccomp2_2.5.4-1+b1_armhf.deb
sudo dpkg -i libseccomp2_2.5.4-1+b1_armhf.deb

# arm64/aarch64
wget https://ftp.debian.org/debian/pool/main/libs/libseccomp/libseccomp2_2.5.4-1+b1_arm64.deb
sudo dpkg -i libseccomp2_2.5.4-1+b1_arm64.deb
```

The following commands can be used to find out whether you fall under the `armhf/armv7l` or `arm64/aarch64` category.

```sh
uname -m
```
