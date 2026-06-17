# --------- Build Stage ----------
FROM node:20-alpine AS builder

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Build NestJS app
RUN npm run build


# --------- Production Stage ----------
FROM node:20-alpine

WORKDIR /app

# Copy only necessary files from builder
COPY package*.json ./
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules

# Set environment
ENV NODE_ENV=production

# Expose NestJS default port
EXPOSE 3000

# Start app
CMD ["node", "dist/main"]