FROM python:alpine
MAINTAINER Oscar Prieto <oscarmpp@gmail.com>

# Needed for the pycurl compilation
ENV PYCURL_SSL_LIBRARY=openssl

# Single layer
RUN apk add --no-cache libcurl \
    && apk add -u --no-cache --virtual .build-deps build-base libffi-dev curl-dev \
    && pip install influxdb pycurl asyncio aiohttp[speedups] requests pytz pycryptodomex scapy \
    && apk del --no-cache --purge .build-deps \
    && rm -rf /var/cache/apk/*

WORKDIR /mnt
