FROM node:10-alpine AS base

WORKDIR /usr/src/app

COPY ./ package.json
COPY ./ yarn.lock 


FROM base AS dependencies
RUN apk update && apk add --no-cache \
    make \
    gcc \
    g++ \
    python

RUN npm install --production

RUN chown -R node:node .

USER node
CMD ["node", "start"]
