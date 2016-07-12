FROM quay.io/justcontainers/base-alpine-without-s6:v3.4
MAINTAINER John Regan <john@jrjrtech.com>

##
## ROOTFS
##

# root filesystem
COPY rootfs /

# s6 overlay
RUN apk add --no-cache wget \
 && wget https://github.com/just-containers/s6-overlay/releases/download/v1.18.1.3/s6-overlay-amd64.tar.gz --no-check-certificate -O /tmp/s6-overlay.tar.gz \
 && tar xvfz /tmp/s6-overlay.tar.gz -C / \
 && rm -f /tmp/s6-overlay.tar.gz \
 && apk del wget

##
## INIT
##

ENTRYPOINT [ "/init" ]
