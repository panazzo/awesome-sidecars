FROM alpine:3.3

RUN apk --no-cache add \
      py-pip \
      python &&\
    pip install --upgrade \
      pip \
      awscli

ENV AWS_ACCESS_KEY_ID=,AWS_SECRET_ACCESS_KEY=,AWS_DEFAULT_REGION=,BUCKET=,BUCKET_PATH=/,CRON_SCHEDULE="* * * * *",PARAMS=

VOLUME ["/data"]

ADD *.sh /
RUN chmod +x /*.sh

ENTRYPOINT ["/start.sh"]