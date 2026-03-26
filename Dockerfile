FROM node:18 AS build

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

RUN echo "Build Stage Completed"

FROM node:18-alpine
WORKDIR /app
COPY --from=build /app /app
CMD ["node","app.js"]
