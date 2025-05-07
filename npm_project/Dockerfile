FROM node:20-alpine AS builder

WORKDIR /app
COPY . .
RUN ls && pwd && npm ci && npm run build
