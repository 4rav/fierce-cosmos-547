# Base image
FROM node:22-alpine

# Install dependencies
RUN apk add --no-cache git ffmpeg libwebp-tools python3 make g++

# Clone your Ragnarok bot repo
RUN git clone -b main https://github.com/souravkl11/raganork-md /rgnk

# Set working directory
WORKDIR /rgnk

# Create persistent data folder
RUN mkdir -p /app/data temp

# Set timezone
ENV TZ=Asia/Kolkata

# Install Node.js global packages
RUN npm install -g --force yarn pm2

# Install bot dependencies
RUN yarn install

# Start the bot
CMD ["npm", "start"]
