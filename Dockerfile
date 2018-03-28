FROM python:alpine
MAINTAINER Oscar Prieto <oscarmpp@gmail.com>

# Install packages
RUN apk add --no-cache libcurl

# Needed for pycurl
ENV PYCURL_SSL_LIBRARY=openssl

# Install packages only needed for building, install and clean on a single layer
RUN apk add --no-cache --virtual .build-dependencies build-base curl-dev \
    && pip install influxdb pycurl requests \
    && apk del .build-dependencies

WORKDIR /mnt
