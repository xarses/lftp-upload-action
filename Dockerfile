FROM alpine:latest

RUN apk --no-cache add lftp openssh-client

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
