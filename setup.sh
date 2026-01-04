#!/bin/bash

# Setup script for Bookstore Project

# Backend Setup
echo "Setting up Backend..."
cd bookStore-Springboot-Vue-master/bookstore_server

# Check for Java
if ! command -v java &> /dev/null
then
    echo "Java is not installed. Please install Java 8 or later."
    exit 1
fi

# Check for Maven
if ! command -v mvn &> /dev/null
then
    echo "Maven is not installed. Please install Maven."
    exit 1
fi

echo "Building Backend..."
mvn clean install -DskipTests

if [ $? -ne 0 ]; then
    echo "Backend build failed."
    exit 1
fi

echo "Backend built successfully."
cd ../..

# Frontend Setup
echo "Setting up Frontend..."
cd bookStore-Springboot-Vue-master/bookstore_client

# Check for Node.js
if ! command -v node &> /dev/null
then
    echo "Node.js is not installed. Please install Node.js."
    exit 1
fi

# Check for NPM
if ! command -v npm &> /dev/null
then
    echo "NPM is not installed. Please install NPM."
    exit 1
fi

echo "Installing Frontend Dependencies..."
npm install --legacy-peer-deps

if [ $? -ne 0 ]; then
    echo "Frontend install failed."
    exit 1
fi

echo "Frontend dependencies installed."
cd ../..

echo "Setup Complete!"
echo "To run the backend:"
echo "  cd bookStore-Springboot-Vue-master/bookstore_server"
echo "  mvn spring-boot:run"
echo ""
echo "To run the frontend:"
echo "  cd bookStore-Springboot-Vue-master/bookstore_client"
echo "  npm run dev"
echo ""
echo "Make sure you have created the database 'bookstore' and imported 'schema.sql'."
