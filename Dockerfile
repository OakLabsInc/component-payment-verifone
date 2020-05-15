FROM node:10.20

WORKDIR /app

COPY package.json package-lock.json /app/

RUN npm install --production

COPY . /app
# RUN chmod +x /app/*

ENTRYPOINT [ "node" ]
CMD ["server.js"]

ENV TZ=America/Los_Angeles \
    PORT=9000 \
    APPLICATION_PORT=9001