### STAGE 1: Builder ###
FROM node:13.7-alpine AS builder
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

### STAGE 2: Run ###
FROM nginx:1.17.8-alpine
COPY --from=builder /usr/src/app/dist/sofnity-front /usr/share/nginx/html
