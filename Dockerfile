FROM node:12.16.3-buster

WORKDIR /app

COPY package.json package-lock.json /app/

RUN npm install --production \
    && mkdir -p /home/swhite/oak/psdk-demo/lib

COPY libPaymentSdk.* /home/swhite/oak/psdk-demo/lib/
COPY . /app
# RUN chmod +x /app/*

ENTRYPOINT [ "node" ]
CMD ["server.js"]

ENV TZ=America/Los_Angeles \
    PORT=9000 \
    APPLICATION_PORT=9001