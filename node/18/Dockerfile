FROM node:18.12.0-alpine 

# Set the working directory and copy files
WORKDIR /app

# Install dependencies and build the application
RUN yarn install

# get port from arg  NODE_PORT or use 3001
ENV NODE_OPTIONS=--openssl-legacy-provider

# Expose the port and start the application
EXPOSE ${PORT}
CMD ["yarn", "start"]

# tag mgonza02/node:18-alpine.1.0.1