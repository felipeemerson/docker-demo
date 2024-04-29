FROM node:18.20.2-alpine AS build-phase
WORKDIR "/usr/app"
COPY package.json .
RUN npm i
COPY . .
RUN npm run build

FROM nginx AS deploy-phase
EXPOSE 80
COPY --from=build-phase /usr/app/dist /usr/share/nginx/html