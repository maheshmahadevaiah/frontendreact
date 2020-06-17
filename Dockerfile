FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# /app/build ==> actual files

FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html


