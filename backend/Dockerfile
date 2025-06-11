FROM node:20

WORKDIR /app

COPY package*.json ./
RUN npm install

# Do NOT copy rest of the files — mounted via volumes

EXPOSE 8000
CMD ["npm", "run", "dev"]
