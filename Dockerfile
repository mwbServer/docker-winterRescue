# syntax=docker/dockerfile:1

FROM openjdk:8-jdk-buster

LABEL version="0.5.5"

RUN apt-get update && apt-get install -y curl wget unzip && \
 addgroup minecraft && \
 adduser --home /data --ingroup minecraft --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD "The Winter Rescue 0.5.5 in Docker"

CMD ["/launch.sh"]
