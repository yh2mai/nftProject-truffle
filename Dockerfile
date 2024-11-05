# Base image
FROM node:18

# Set the working directory inside the container
WORKDIR /truffle

# Copy the package.json and package-lock.json files to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install -g truffle

# Install dependencies
RUN npm install

# Copy the rest of the Truffle project files
COPY . .

# Set up a volume to share build files with other containers
VOLUME /truffle/build

# Run Truffle migrations by default
CMD ["truffle", "migrate", "--network", "development"]
