# Base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json files to install dependencies
COPY package*.json ./

# Install Truffle and other dependencies
RUN npm install -g truffle

# Install dependencies, including OpenZeppelin and dotenv
RUN npm install && npm install @openzeppelin/contracts dotenv

# Copy the rest of the Truffle project files
COPY . .

# Set up a volume to share build files with other containers
VOLUME /app/build

# Run Truffle migrations by default
CMD ["truffle", "migrate", "--network", "development"]
