FROM alpine:latest

# Optional: add some useful tools
RUN apk add --no-cache bash curl

# Default working directory
WORKDIR /app

# Copy all project files (optional)
COPY . .

# Expose a dummy port (match whatever you use in deploy.sh)
EXPOSE 3000

# Keep container running indefinitely
CMD ["tail", "-f", "/dev/null"]
