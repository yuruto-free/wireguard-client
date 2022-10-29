# Define environment variables for WireGuard client
## `.env` file for WireGuard client
Create an environment variable configuration file `.env` in the following format.

```sh
PEER_IP_ADDRESS=10.1.2.2
PEER_PRIVATE_KEY=ABCDEfghijklmnOPQRstuvwxyz0123456789=+/*-abc
MTU=1380
TARGET_DNS=10.1.2.1
CLIENT_SUBNET=10.0.16.0/24
PUBLIC_KEY=BCDEfghijklmnOPQRstuvwxyz0123456789=+/*-abcd
PRESHARED_KEY=CDEfghijklmnOPQRstuvwxyz0123456789=+/*-abcde
ENDPOINT_URI=example.vpn.com:51820
KEEP_ALIVE=10
PEER_ALLOWED_IPS=10.1.2.0/24
```

A function of each environment variable is given below.

|Env|Funciton|
|:----|:----|
|PEER_IP_ADDRESS|IP address of VPN client|
|PEER_PRIVATE_KEY|Private key for VPN client|
|MTU|Maximum datagram size that can be transferred in one communication.|
|TARGET_DNS|DNS used by VPN connection|
|CLIENT_SUBNET|Client subnet you'd like to add|
|PUBLIC_KEY|Public key for VPN server|
|PRESHARED_KEY|Preshared key between VPN server and VPN client|
|ENDPOINT_URI|Endpoint of VPN server|
|KEEP_ALIVE|Interval of communication confirmation.|
|PEER_ALLOWED_IPS|Optional. The IPs/Ranges that the peers will be able to reach using the VPN connection.|
