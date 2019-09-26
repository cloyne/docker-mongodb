FROM registry.gitlab.com/tozd/docker/runit:ubuntu-xenial

EXPOSE 27017/tcp

VOLUME /var/lib/mongodb
VOLUME /var/log/mongod

RUN apt-get update -q -q && \
 apt-get install --yes --force-yes mongodb && \
 apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm && \
 echo -e "replication:\n  replSetName: \"rs01\"" | sudo tee -a /etc/mongod.conf

COPY ./etc /etc
