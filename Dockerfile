FROM debian:bullseye-slim

WORKDIR /app

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -yq install --no-install-recommends nodejs npm \
    && mkdir -p /home/rjoffray/oak/psdk-demo/lib

COPY . /app
COPY libPaymentSdk.* /home/rjoffray/oak/psdk-demo/lib/

RUN npm install --production

ENTRYPOINT [ "node" ]
CMD ["server.js"]

ENV TZ=America/Los_Angeles \
    PORT=9000 \
    APPLICATION_PORT=9001