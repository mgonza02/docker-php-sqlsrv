FROM node:24.13.1-alpine3.22 AS builder

# Set production environment
ENV NODE_ENV=production

# Set the working directory
WORKDIR /app

# Install build dependencies
RUN apk add --no-cache \
    xdg-utils \
    python3 \
    make \
    g++

# Install node-gyp globally
RUN yarn global add node-gyp

# Note: This is a base builder image
# Mount your app code via docker-compose volumes or use this as a base image
# The following lines are commented out for the base image build:
# COPY package.json yarn.lock* ./
# RUN yarn install --frozen-lockfile --production=false
# COPY . .
# RUN yarn build

# Expose common ports
EXPOSE 3000 3001

# Default command
CMD ["yarn", "start"]

# tag mgonza02/node:24.13.1-alpine-builder
