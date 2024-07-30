FROM node:lts-alpine

# Install a simple HTTP server to serve static content
RUN npm install -g http-server

# Set the working directory
WORKDIR /serverWeb

# Copy 'package.json' and 'package-lock.json' (if available)
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the project files and folders to the working directory (e.g., 'app' folder)
COPY . .

# Ensure correct file permissions
RUN chmod -R 755 /serverWeb

# Build the app for production by minifying it
RUN npm run build

# Expose port 8080
EXPOSE 8080

# Start the HTTP server on port 8080
CMD ["http-server", "dist"]
