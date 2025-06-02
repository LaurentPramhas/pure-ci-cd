# Build Stage
FROM node:18 AS build

WORKDIR /app
COPY code/ .


# Wenn du KEIN package-lock.json hast, nimm nur "npm install"
RUN npm install && npm run build

# Production Stage
FROM nginx:alpine
COPY --from=build /app/target /usr/share/nginx/html

