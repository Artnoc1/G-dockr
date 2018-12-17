FROM alpine:latest

# Fix mirror issues:

COPY mirrors /tmp/mirrors 
COPY setup.sh /tmp/setup.sh

RUN	chmod 0755 /tmp/setup.sh && \
	/tmp/setup.sh && \
	rm /tmp/*

RUN apk update --no-cache  && \
	apk add ncdu curl bash

