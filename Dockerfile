# starting point: an image of node-12
FROM node:12-alpine

# create the app directory inside the image and use it as root from now on
WORKDIR /usr/src/app

# install app dependencies from the files package.json and package-lock.json
# installing before transfering the app files allows us to take advantage of cached Docker layers
COPY package*.json ./
# RUN npm install

# If you are building your code for production
RUN npm ci --only=production

# transfer the app codebase files to the root directory of the app
COPY ./ ./

# build the app
RUN npm run build

# start the app on image startup
CMD ["npm", "run", "start"]
