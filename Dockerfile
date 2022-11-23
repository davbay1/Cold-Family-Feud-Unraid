FROM node:16-alpine


COPY . /src
WORKDIR /src

RUN rm -r node_modules
RUN rm -f package-lock.json
RUN npm install


RUN apk add ruby bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh


RUN npm ci
RUN npm run build

CMD ["npm", "run", "start"]

