FROM node:10.15.3-stretch

WORKDIR /app

COPY package.json package-lock.json /app/

RUN npm install --production && npm cache clean --force \
    && chmod +x PSDK_Test

COPY . /app

CMD ["/app/server.js"]

ENV TZ=America/Los_Angeles \
    PORT=9000 \
    APPLICATION_PORT=9001