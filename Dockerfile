# Use the official Nginx image from Docker Hub
FROM nginx:alpine

# Copy your static website or app files into the Nginx HTML directory
COPY ./html /usr/share/nginx/html

# Expose port 80 for HTTP traffic
EXPOSE 80

# Nginx starts automatically when the container runs
