# Copyright 2021 Suresoft Technologies Inc.
# Licensed under the MIT
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      software-properties-common git build-essential libjpeg-dev python3 python3-pip bear wget automake libtool

RUN pip3 install gcovr
RUN git config --global user.email "minhyuk@suresofttech.com"
RUN git config --global user.name "Peter Kwon"

RUN useradd --create-home --home-dir /home/workspace --shell /bin/bash defects4cpp

USER defects4cpp
ENV USER defects4cpp
WORKDIR /home/workspace
