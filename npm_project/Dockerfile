FROM node:20-alpine AS builder

WORKDIR /app
COPY . .
RUN npm ci && npm run build
