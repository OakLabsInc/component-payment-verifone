FROM debian:bullseye-slim

WORKDIR /app

COPY package.json package-lock.json /app/

RUN npm install --production \
    && mkdir -p /home/swhite/oak/psdk-demo/lib \
    && apt-get update \
    && apt-get -y upgrade \ 
    && apt-get install curl \
    && curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - 

COPY libPaymentSdk.* /home/swhite/oak/psdk-demo/lib/
COPY . /app
# RUN chmod +x /app/*

ENTRYPOINT [ "node" ]
CMD ["server.js"]

ENV TZ=America/Los_Angeles \
    PORT=9000 \
    APPLICATION_PORT=9001