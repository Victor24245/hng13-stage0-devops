# ============================
# Stage 1: Build
# ============================
FROM node:18-alpine AS build

# Set working directory
WORKDIR /usr/src/app

# Copy dependency files first (for caching)
COPY package*.json ./

# Install dependencies
RUN npm ci --omit=dev

# Copy the rest of the application
COPY . .

# ============================
# Stage 2: Runtime
# ============================
FROM node:18-alpine

WORKDIR /usr/src/app

# Copy files from the build stage
COPY --from=build /usr/src/app /usr/src/app

# Set environment variables
ENV NODE_ENV=production

# Expose the internal port (match user input)
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
