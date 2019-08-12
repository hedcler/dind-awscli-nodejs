FROM docker:latest

# Define NODE_ENV
ARG ENV
ENV ENV=$ENV

RUN apk -Uuv add make gcc groff less \
        musl-dev libffi-dev openssl-dev \
        python2-dev py-pip nodejs npm \
    && pip install awscli docker-compose \
    && apk --purge -v del py-pip \
    && rm /var/cache/apk/*

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD [ "node" ]

