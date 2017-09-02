FROM quay.io/justcontainers/base-alpine-without-s6:v3.4.3
MAINTAINER John Regan <john@jrjrtech.com>

##
## ROOTFS
##

# root filesystem
COPY rootfs /

# s6 overlay
RUN apk add --no-cache curl grep sed \
 && curl -LOk `curl --silent https://api.github.com/repos/just-containers/s6-overlay/releases/latest | /usr/bin/awk '/browser_download_url/ { print $2 }' | /usr/bin/grep 'amd64.tar.gz"' | /usr/bin/sed 's/"//g'` \
		| tar xvzf - -C / \
	&& apk del --no-cache curl grep sed 

##
## INIT
##

ENTRYPOINT [ "/init" ]
