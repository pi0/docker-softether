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

## docker-compose

```yaml
version: '2'

services: 

  softether:
    image: pooya/softether
    volumes:
      - ./data/softether/etc:/etc/vpnserver
      - ./data/softether/log:/var/log/vpnserver
    ports: 
      - "992:992"
      - "1194:1194/udp"
      - "5555:5555"
      - "500:500/udp"
      - "4500:4500/udp"
      - "1701:1701/udp"
    network_mode: "bridge"
    restart: always
```
