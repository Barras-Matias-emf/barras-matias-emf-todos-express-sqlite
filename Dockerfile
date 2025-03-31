FROM node:22-alpine

# Copier uniquement package.json
COPY ./package.json . 

# Installer les dépendances
RUN npm install 

COPY . . 

EXPOSE 3000
RUN mkdir -p /var/db && \
chown -R node:node /var/db && \
chmod -R 777 /var/db
VOLUME [ "/var/db" ]
CMD [ "node", "./bin/www" ]
