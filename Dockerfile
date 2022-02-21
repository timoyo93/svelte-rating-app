FROM node:16-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN yarn install
COPY . .

RUN yarn build

EXPOSE 8080

ENV HOST=0.0.0.0

ENTRYPOINT ["yarn", "start"]
