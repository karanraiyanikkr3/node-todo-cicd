# Use the official Node.js runtime as a parent image
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Install any needed dependencies specified in package.json
RUN npm install

# Copy the rest of the application code to the working directory
COPY * ./

# Create a group and user
RUN addgroup -S devops && adduser -S master -G devops

# Tell docker that all future commands should run as the master user
USER master

# Expose port 80 for the application to listen on
EXPOSE 4000

# Start the application
CMD [ "node", "index.js" ]
