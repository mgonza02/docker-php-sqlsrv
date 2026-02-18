FROM node:24.13.1-alpine3.22
# FROM node:20.9.0-alpine

# Set the working directory and copy files
WORKDIR /app

# install xdg-utils
RUN apk add --no-cache xdg-utils

RUN npm install -g node-gyp

# Install dependencies and build the application
RUN yarn install

# get port from arg  NODE_PORT or use 3001
ENV NODE_OPTIONS=--openssl-legacy-provider

# Expose the port and start the application
EXPOSE ${PORT}
CMD ["yarn", "start"]

# tag mgonza02/node:24.13.1-alpine.1.0.1
