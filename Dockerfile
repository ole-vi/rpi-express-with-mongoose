FROM  balenalib/raspberry-pi:stretch

RUN apt-get update && apt update
RUN apt-get install wget libatomic1

RUN wget https://nodejs.org/dist/v12.16.3/node-v12.16.3-linux-armv7l.tar.xz \ 
    && tar -xaf node-v12.16.3-linux-armv7l.tar.xz \ 
    && cd node-v12.16.3-linux-armv7l

RUN cd node-v12.16.3-linux-armv7l \
    && cp -R * /usr/local/

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080
CMD [ "npm", "start" ]
