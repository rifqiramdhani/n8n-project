FROM node:20-alpine

# Install dependencies in a single layer
RUN apk add --no-cache graphicsmagick tzdata ffmpeg python3 build-base && \
    npm install --location=global n8n@latest ffmpeg && \
    apk del build-base

# Set working directory
WORKDIR /data

# Expose the port as an environment variable
EXPOSE 5678

# Set environment variables
ENV N8N_USER_ID=root \
    N8N_PORT=5678

# Run the app as a non-root user
USER node

# Start n8n
CMD n8n start
