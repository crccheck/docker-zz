# ## My Little Utility
#
# Simple Ubuntu container with convenient things I like built in already.
# TODO prioritize image size so I can download this image faster

FROM ubuntu:22.04
LABEL org.opencontainers.image.authors="Chris <c@crccheck.com>"

RUN apt-get update -qq && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install \
  # basic packages that are normally pre-installed
  curl wget telnet bsdmainutils \
  # for apachebench
  apache2-utils \
  # Python
  python3 python3-pip \
  # extras
  make vim git
# don't delete cache to make it easier to install things
WORKDIR /root
ENV HOME /root
ENV _CACHEBUSTER 3af3534
RUN curl --location --silent \
  https://github.com/crccheck/dotfiles/archive/master.tar.gz | \
  tar xz \
  --exclude="gnome-terminal" \
  --exclude="iterm" \
  --exclude="resources" \
  --exclude="sublime-text-2" \
  --exclude="sublime-text-3" \
  --exclude=".atom" \
  --exclude="virtualenv" && \
  mv dotfiles-master /root/.dotfiles
RUN cd /root/.dotfiles && make dotfiles vim
