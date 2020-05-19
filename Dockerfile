FROM debian:bullseye-slim

WORKDIR /app

COPY package.json package-lock.json /app/

RUN mkdir -p /home/swhite/oak/psdk-demo/lib \
    && apt-get update \
    && apt-get -yq install curl gnupg \
    && curl -sL https://deb.nodesource.com/setup_12.x  | bash - \
    && apt-get -yq install nodejs \
    && npm install --production

COPY libPaymentSdk.* /home/swhite/oak/psdk-demo/lib/
COPY . /app
# RUN chmod +x /app/*

ENTRYPOINT [ "node" ]
CMD ["server.js"]

ENV TZ=America/Los_Angeles \
    PORT=9000 \
    APPLICATION_PORT=9001