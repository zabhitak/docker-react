FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# /app/build <--- all stuff

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /user/share/nginx/html