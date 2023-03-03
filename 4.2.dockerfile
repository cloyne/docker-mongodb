FROM registry.gitlab.com/tozd/docker/runit:ubuntu-bionic

EXPOSE 27017/tcp

VOLUME /var/lib/mongodb
VOLUME /var/log/mongod

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E162F504A20CDF15827F718D4B7C549A058F8B6B && \
 echo "deb http://repo.mongodb.org/apt/ubuntu $(cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d= -f2)/mongodb-org/4.2 multiverse" > /etc/apt/sources.list.d/mongodb.list && \
 apt-get update -q -q && \
 apt-get install --yes --force-yes mongodb-org && \
 apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm \
 mkdir /etc/service

COPY ./etc /etc
