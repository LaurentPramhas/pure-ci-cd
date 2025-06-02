# Schritt 1: Baue das Projekt mit Node
FROM node:18 as build

WORKDIR /app
COPY . .

RUN npm ci && npm run build

# Schritt 2: Liefere gebauten Code mit NGINX aus
FROM nginx:alpine

COPY --from=build /app/target /usr/share/nginx/html
