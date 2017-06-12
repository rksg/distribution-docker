FROM ubuntu:16.04

RUN apt-get update && apt-get install -y cron curl

RUN curl https://static.imply.io/release/imply-$IMPLY_VERSION.tar.gz \
    --compressed > /root/imply-$IMPLY_VERSION.tar.gz && \
    tar -xzf /root/imply-$IMPLY_VERSION.tar.gz

# Prepare OS
COPY setup-os.sh /root
COPY nodesource-pubkey /root/nodesource-pubkey
RUN /root/setup-os.sh

EXPOSE 1527 2181 8081 8082 8083 8090 8091 8100 8101 8102 8103 8104 8105 8106 8107 8108 8109 8110 8200 9095

WORKDIR /root/imply-$IMPLY_VERSION

CMD ["bin/supervise", "-c", "conf/supervise/quickstart.conf"]
