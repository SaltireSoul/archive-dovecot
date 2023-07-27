# Base idea :https://github.com/ajoergensen/docker-dovecot-mailarchive
# simple dovecot config: (https://doc.dovecot.org/configuration_manual/howto/simple_virtual_install/)
# general docker setup example : https://github.com/1wilkens/dockerfiles/blob/master/dovecot/alpine-3.15/Dockerfile
FROM ajoergensen/baseimage-alpine

LABEL maintainer "Chris Drexler <ckolumbus@ac-drexler.de>"

RUN apk add --no-cache shadow \
     dovecot \
     dovecot-lmtpd \
     dovecot-pigeonhole-plugin \
     rspamd-client \
     && rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

# Add service files.
COPY root/ /
RUN chmod -v +x /etc/services.d/*/run 

RUN addgroup --gid 5000 vmail  \
    && adduser -h /home/vmail -u 5000 -G vmail -D vmail
    #&& adduser dovecot && adduser dovenull \

EXPOSE 24 143 993 4190

VOLUME /home/vmail

