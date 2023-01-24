FROM node:16 AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod
RUN ls

#stage 2
FROM nginx
COPY --from=build /app/dist/akhil-app/ /usr/share/nginx/html/

