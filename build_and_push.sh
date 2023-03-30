#!/bin/bash

# Define variables
AWS_REGION=us-east-1
ECR_REPO_NAME=app
DOCKER_IMAGE_NAME=demo-app

# Authenticate with ECR
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin 838596736137.dkr.ecr.$AWS_REGION.amazonaws.com

# Build the Docker image
docker build -t $DOCKER_IMAGE_NAME:v2 .

# Tag the Docker image
docker tag $DOCKER_IMAGE_NAME:v2 838596736137.dkr.ecr.$AWS_REGION.amazonaws.com/app$ECR_REPO_NAME/$DOCKER_IMAGE_NAME:v2

# Push the Docker image to ECR
docker push 838596736137.dkr.ecr.$AWS_REGION.amazonaws.com/app$ECR_REPO_NAME/$DOCKER_IMAGE_NAME:v2
