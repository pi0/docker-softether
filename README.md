# Docker image for SoftEther VPN

This will deploy a fully functional [SoftEther VPN](https://www.softether.org) server as a docker image.
Fork image Available on [Docker Hub](https://hub.docker.com/u/pooya/softether/).

## Download

```bash
docker pull pooya/softether
```

## Usage

```bash
docker run -d -net host --cap-add NET_ADMIN --name softether \
    -v /etc/vpnserver:/etc/vpnserver \
    -v /var/log/vpnserver:/var/log/vpnserver
    pooya/softether
```

You may also use a **docker-compose.yml** file :

```yaml
version: '2'
services: 
  softether:
    image: pooya/softether
    volumes:
      - ./data/softether/etc:/etc/vpnserver
      - ./data/softether/log:/var/log/vpnserver
    cap_add: [NET_ADMIN]
    network_mode: host
    restart: always
```
Then:
```sh
docker-compose up -d
```
