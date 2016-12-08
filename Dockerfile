FROM ubuntu:16.04

MAINTAINER Shigure Onishi <onishishigure@gmail.com>
WORKDIR /tmp

ENV COFU_VERSION=v0.2.0

RUN \
  apt-get update && \
  apt-get install -y wget unzip sudo && \
  wget -P /tmp https://github.com/kohkimakimoto/cofu/releases/download/${COFU_VERSION}/cofu_linux_amd64.zip && \
  unzip cofu_linux_amd64.zip && \
  mv cofu /usr/local/sbin/cofu && \
  chmod 744 /usr/local/sbin/cofu && \
  rm -rf /tmp/* && \
  rm -rf /var/tmp/*

ADD ./docker-entrypoint.sh /docker-entrypoint.sh

CMD ["/docker-entrypoint.sh"]

