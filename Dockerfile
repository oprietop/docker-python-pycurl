FROM python:alpine
MAINTAINER Oscar Prieto <oscarmpp@gmail.com>

# Needed for the pycurl compilation
ENV PYCURL_SSL_LIBRARY=openssl

# Single layer
RUN apk add -u --no-cache libcurl libstdc++ \
    && apk add -u --no-cache --virtual .build-deps build-base g++ libffi-dev curl-dev \
    && pip install --no-cache-dir pycurl asyncio aiohttp[speedups] pycryptodomex scapy pandas \
    && pip install --no-cache-dir pytz influxdb slackclient certifi xlsxwriter \
    && apk del --no-cache --purge .build-deps \
    && rm -rf /var/cache/apk/*
    
WORKDIR /mnt
