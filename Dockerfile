#appertly/mernjs is basic mern-stack install application meant to be run along side mongodb
#it includes react-scripts and nodemon for development

FROM ubuntu:latest
MAINTAINER Stephanie McLaren

EXPOSE 80 443 3000 35729 3001

ENV NODE_ENV development

RUN apt-get update -q \
    && apt-get install -yqq \
    curl \
    git \
    ssh \
    gcc \
    make \
    build-essential \
    libkrb5-dev \
    sudo \
    apt-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN sudo apt-get install -yq nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN npm install --global nodemon --global react-scripts --global foreman

RUN mkdir -p /opt/mern.js
ADD Procfile /opt/mern.js/Procfile
WORKDIR /opt/mern.js

CMD nf start -p 3000