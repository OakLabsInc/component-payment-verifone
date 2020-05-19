FROM debian:bullseye-slim

WORKDIR /app

COPY package.json package-lock.json /app/

RUN mkdir -p /home/swhite/oak/psdk-demo/lib \
    && apt-get update \
    && mkdir -p /home/swhite/oak/psdk-demo/lib \
    && apt-get install curl \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash \
    && nvm install node \
    && npm install --production

COPY libPaymentSdk.* /home/swhite/oak/psdk-demo/lib/
COPY . /app
# RUN chmod +x /app/*

ENTRYPOINT [ "node" ]
CMD ["server.js"]

ENV TZ=America/Los_Angeles \
    PORT=9000 \
    APPLICATION_PORT=9001