FROM node:20-alpine
RUN apk add --no-cache git ffmpeg python3 make g++ bash curl
WORKDIR /app
RUN git clone https://github.com/souravkl11/raganork-md.git .
RUN npm install -g pm2
RUN npm install --force
RUN npm install jimp yt-dlp ytdl-core yt-search axios ffmpeg-static
EXPOSE 3000
CMD ["pm2-runtime", "index.js", "--name", "raganork-md"]
