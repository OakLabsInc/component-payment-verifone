FROM node:10.15.3-stretch

WORKDIR /app

COPY package.json package-lock.json /app/

RUN npm install --production && npm cache clean --force

COPY . /app
RUN chmod +x ./app/PSDK_Test

CMD ["/app"]

ENV TZ=America/Los_Angeles \
    PORT=9000 \
    APPLICATION_PORT=9001