FROM node:18-alpine
WORKDIR /app

# Configure npm for better network reliability
RUN npm config set fetch-timeout 300000
RUN npm config set fetch-retries 5

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies with options to improve reliability
RUN npm install --no-fund --no-audit --prefer-offline

# Copy application code
COPY . .

# Expose port
EXPOSE 8082

# Start the application
CMD ["npm", "start"]
