FROM node:20-alpine AS builder

WORKDIR /app
COPY . .
RUN cd npm_project && npm ci && npm run build
