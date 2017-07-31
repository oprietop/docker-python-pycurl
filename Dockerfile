FROM python:alpine
MAINTAINER Oscar Prieto <oscarmpp@gmail.com>

# Install packages
RUN apk add --no-cache libcurl

# Install packages only needed for building
RUN apk add --no-cache --virtual .build-dependencies build-base curl-dev

# Needed for pycurl
ENV PYCURL_SSL_LIBRARY=openssl

# Pip stuff
RUN pip install influxdb pycurl

# Remove unneed packages
RUN apk del .build-dependencies

WORKDIR /mnt
