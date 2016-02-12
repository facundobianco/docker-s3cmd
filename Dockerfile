FROM python:2.7-alpine
MAINTAINER Facundo Bianco <vando@van.do>

RUN apk add --no-cache ca-certificates openssl

RUN mkdir /usr/local/src /mnt/hdd
RUN wget -O - http://downloads.sourceforge.net/project/s3tools/s3cmd/1.6.0/s3cmd-1.6.0.tar.gz | \
    tar -zxv -C /usr/local/src -f -
RUN cd /usr/local/src/s3cmd-1.6.0 ; python2 setup.py install
RUN rm -r /usr/local/src

WORKDIR /mnt/hdd

VOLUME ["/mnt/hdd"]
