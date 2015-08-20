FROM alpine:3.2
MAINTAINER John Regan <john@jrjrtech.com>

##
## ROOTFS
##

# root filesystem
COPY rootfs /

# provide exec permission to basic utils
RUN chmod 0755 /sbin/apk-install

# s6 overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.14.0.1/s6-overlay-amd64.tar.gz /tmp/s6-overlay.tar.gz
RUN tar xvfz /tmp/s6-overlay.tar.gz -C /

##
## INIT
##

ENTRYPOINT [ "/init" ]
