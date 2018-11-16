FROM golang:1.6.2-alpine

RUN apk update && apk add gcc ca-certificates openssl musl-dev git fuse

# add syslog-ng (syslog required by Goofys)
RUN apk add syslog-ng
RUN echo "@version: 3.7" > /etc/syslog-ng/syslog-ng.conf
RUN echo "source s_local {internal();network(transport("udp"));unix-dgram("/dev/log");};" >> /etc/syslog-ng/syslog-ng.conf
RUN echo "destination d_local {file("/var/log/messages");};" >> /etc/syslog-ng/syslog-ng.conf
RUN echo "log {source(s_local);destination(d_local);};" >> /etc/syslog-ng/syslog-ng.conf

RUN mkdir /data
VOLUME ["/data"]

ENV MOUNT_DIR /data
ENV REGION us-east-1
ENV BUCKET test-panazzo-bucket-sync
ENV STAT_CACHE_TTL 1m0s
ENV TYPE_CACHE_TTL 1m0s
ENV DIR_MODE 0500
ENV FILE_MODE 0500

ADD ./bin/run.sh /root/run.sh
ADD ./goofys /root/goofys

RUN chmod +x /root/goofys
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2


ENTRYPOINT ["sh"]
CMD ["/root/run.sh"]