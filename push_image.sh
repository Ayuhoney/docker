#!/bin/bash

# Set your Docker Hub username
DOCKERHUB_USERNAME="your_username"

# Log in to Docker Hub
echo "Logging in to Docker Hub..."
docker login -u $DOCKERHUB_USERNAME

# List all local images
echo "Listing local Docker images..."
images=$(docker images --format "{{.Repository}}:{{.Tag}}")

# Loop through each image and push to Docker Hub
echo "Pushing images to Docker Hub..."
for image in $images; do
    echo "Pushing $image..."
    docker push $image
done

echo "All images pushed to Docker Hub."
