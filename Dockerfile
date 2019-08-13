FROM docker:latest

ARG ENV
ENV ENV=$ENV

RUN apk update

RUN \
    apk -Uuv add make gcc groff less \
        musl-dev libffi-dev openssl-dev \
        python2-dev py-pip && \
    pip install awscli docker-compose && \
    apk --purge -v del py-pip && \
    rm /var/cache/apk/*

RUN \
    apk add nodejs npm && \
    npm install -g npm@latest && \
    rm /var/cache/apk/* && \
    npm --version && \
    node --version

