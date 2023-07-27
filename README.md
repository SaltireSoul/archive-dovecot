# archive-dovecot
**DO NOT** use on public server

A dovecot imap server to be used as an independent central archiving service within a local network.

ajoergensen's base image supports AMD64, ARM64 & ARMv7 [GitHub](https://github.com/ajoergensen/baseimage-alpine) [dockerhub](https://hub.docker.com/r/ajoergensen/baseimage-alpine).

![Image Size][shieldsize] [![Image Docker Hub Registry](https://img.shields.io/static/v1.svg?color=blue&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=saltiresoul&message=Docker%20Registry&logo=docker)](https://hub.docker.com/r/saltiresoul/archive-dovecot) [![Image GitHub Registry](https://img.shields.io/static/v1.svg?color=blueviolet&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=saltiresoul&message=GitHub%20Package&logo=github)](https://github.com/SaltireSoul/archive-dovecot/pkgs/container/archive-dovecot)

[shieldsize]: https://img.shields.io/docker/image-size/saltiresoul/archive-dovecot/latest?style=for-the-badge

### Difference to local-imap-archive-container
None.

This repo simply builds & pushes images to Docker Hub & GHCR.  No other changes made. **[Original Source](https://github.com/ckolumbus/local-imap-archive-container)**


## Quick Start

**IMPORTANT**: default user account is `archive:archive`

You can change the username before starting service

```
git clone https://github.com/SaltireSoul/archive-dovecot.git
cd archive-dovecot
cp data/conf/users.example data/conf/users
docker-compose up -d
```

#### Change Password

```
docker-compose exec dovecot doveadm pw -s sha256-crypt
```
Replace `{PLAIN}archive` within `data/conf/users` with generated hash

## Enable SSL
* See `data/conf/dovecot.conf`