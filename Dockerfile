FROM node:12-alpine

# create the app directory inside the image and use it as working directory
WORKDIR /usr/src/app
COPY --chown=node:node . /usr/src/app

# copy package files on the image
COPY package*.json ./

# install node packages. if you are building a production image, uncomment the ci installation
RUN npm install
#RUN npm ci --only=production

# transfer the app files
COPY ./ ./

# build the app
RUN npm run build

# change user to node
USER node

# start the app on image startup
CMD ["npm", "run", "start"]
