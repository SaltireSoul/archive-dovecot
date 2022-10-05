# README for local IMAP archive docker service

This is a docker compose recipe for creating a local dovecot imap server 
instance to be used as email client independent central archiving service
within a local network.

**IMPORTANT**: due to the simple default configuration this container is
not intendend for providing a public internet facing service.

**IMPORTANT**: default account in the example is `archive:archive`, for improved
security consider

* changing the password/account (see below) 
* enable ssl (see `data/conf/dovecot.conf`)

## Prerequisites

Installed (below are the debian package names)

* docker-ce
* docker-compose or docker-compose-plugin

Examples based on `docker-compose` syntax

## Start

```
git clone https://github.com/ckolumbus/local-imap-archive-container.git
cd local-imap-archive-container
docker-compose up -d
```

## Config

### quick start

`cp data/conf/users.example data/conf/users`

### create user/password entries

generate hash entry

```
docker-compose exec dovecot doveadm pw -s sha256-crypt
```

add a line 

```
<username>:<hash from above>
```

to  `./data/conf/users`

See [details here](https://doc.dovecot.org/configuration_manual/authentication/passwd_file/#examples)
for more options on how to edit the user password file.


## References

* [user config](https://github.com/1wilkens/dockerfiles/blob/master/dovecot/alpine-3.15/Dockerfile)
* [Simple config](https://doc.dovecot.org/configuration_manual/howto/simple_virtual_install/)
