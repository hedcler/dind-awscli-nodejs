FROM docker:latest

# Host Environment
ARG ENV
ENV ENV=$ENV

# NodeJS Environment
ARG NODE_ENV
ENV NODE_ENV=$NODE_ENV

# Update repositories
RUN apk update

# Install aws cli
RUN \
    apk -Uuv add make gcc groff less \
        musl-dev libffi-dev openssl-dev \
        python2-dev py-pip && \
    pip install awscli docker-compose && \
    apk --purge -v del py-pip && \
    rm /var/cache/apk/*

# Install NodeJS and update NPM
RUN \
    apk add nodejs npm && \
    npm install -g npm@latest && \
    rm /var/cache/apk/* && \
    npm --version && \
    node --version

