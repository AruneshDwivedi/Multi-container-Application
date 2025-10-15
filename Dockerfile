# Use official Node.js image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files first (for better caching)
COPY package*.json ./

# Install ALL dependencies, including dev dependencies
RUN npm install

# Copy rest of your project
COPY . .

# Fix permissions (important for Alpine)
RUN chmod -R 755 /app

# Expose port
EXPOSE 3000

# Start the app using nodemon safely
CMD ["npx", "nodemon", "src/index.js"]
