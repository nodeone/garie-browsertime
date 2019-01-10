FROM node:10-slim

RUN apt update \
 && apt install libltdl-dev -y \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/garie-browsertime
RUN mkdir -p /usr/src/garie-browsertime/reports

WORKDIR /usr/src/garie-browsertime

COPY package.json .

RUN npm install
RUN rm -rf /tmp/* && rm -rf /var/cache/apt/*

COPY . .

EXPOSE 3000

VOLUME ["/usr/src/garie-browsertime/reports", "/usr/src/garie-lighthouse/logs"]

ENTRYPOINT ["/usr/src/garie-browsertime/docker-entrypoint.sh"]

CMD ["npm", "start"]
