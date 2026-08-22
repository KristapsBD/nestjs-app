FROM node:20-alpine

WORKDIR /usr/src/app

# Copy package management files first to leverage Docker layer caching
COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "run", "start:dev"]