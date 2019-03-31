FROM lsiobase/alpine:3.9

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="ironicbadger"

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache \
   ansible

COPY . /ansible
WORKDIR /ansible

ENTRYPOINT [ "ansible-playbook", "generate.yml" ]
