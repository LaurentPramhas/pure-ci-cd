FROM node:18 as build

WORKDIR /app
COPY . .
RUN npm ci && npm run build

FROM nginx:alpine
COPY --from=build /app/target /usr/share/nginx/html
