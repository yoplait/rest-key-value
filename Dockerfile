FROM node
# FROM node:14
# FROM node:12-alpine

LABEL authors="Juan Carlos Perez"
LABEL maintainer="Juan Carlos Perez <perezpardojc@gmail.com>"
LABEL contributor="Eitan Schichmanter <perezpardojc@gmail.com>"

# RUN apk update && apk upgrade && apk add docker && rm -rf /var/apk/cache/*

# ENV LANG C.UTF-8
# ENV LC_ALL C.UTF-8

# COPY . /app
# WORKDIR /app
# ENV NODE_ENV production
# # RUN yarn install --frozen-lockfile

# RUN npm install -g npm-check-updates \
#     ncu -u \
#     npm install \
#     npm install express \
#     npm install babel-cli \
#     npm install babel-preset \
#     npm install babel-preset-env

# RUN npm ci --only=production

# ENTRYPOINT ["node", "server.js"]


# update dependencies and install curl
RUN apt-get update && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
# COPY package*.json ./ \
#     ./source ./

# This will copy everything from the source path 
# --more of a convenience when testing locally.
COPY . .
# update each dependency in package.json to the latest version
RUN npm install -g npm-check-updates \
    ncu -u \
    npm install
    # npm install \
    # npm run test \
    # npm run watch 
    # npm run start
    # npm install express \
    # npm install babel-cli \
    # npm install babel-preset \
    # npm install babel-preset-env

# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . /app
EXPOSE 3000
CMD [ "node", "server.js" ]
# CMD [ "npm", "run",  "dev" ]

