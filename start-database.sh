#!/usr/bin/env bash

DB_CONTAINER_NAME="payload_example"

# Check if Docker is installed
if ! [ -x "$(command -v docker)" ]; then
  echo "Docker is not installed. Please install docker and try again."
  echo "Docker install guide: https://docs.docker.com/engine/install/"
  exit 1
fi

# Start the container if it already exists
if [ "$(docker ps -q -f name=$DB_CONTAINER_NAME)" ]; then
  docker start $DB_CONTAINER_NAME
  echo "Database container started"
  exit 0
fi

# Load environment variables from .env file
set -a
source .env

# Extract the password from DATABASE_URL
DB_PASSWORD=$(echo $DATABASE_URL | awk -F':' '{print $3}' | awk -F'@' '{print $1}')

if [ "$DB_PASSWORD" = "password" ]; then
  echo "You are using the default database password"
fi

# Run a PostGIS-enabled PostgreSQL container
docker run --name $DB_CONTAINER_NAME \
  -e POSTGRES_PASSWORD=$DB_PASSWORD \
  -e POSTGRES_HOST_AUTH_METHOD=trust \
  -e POSTGRES_DB=payload_example \
  -d -p 5433:5433 \
  postgres:latest

echo "Database container was successfully created"