# Set variables
$awsRegion = "us-east-1"
$ecrRepository = "app"
$dockerImage = "demo-app"
$dockerTag = "latest"
$containerName = "akshay-container"

# Authenticate with ECR
(Get-ECRLoginCommand).Password | docker login --username AWS --password-stdin 838596736137.dkr.ecr.us-east-1.amazonaws.com

# Build and tag Docker image
docker build -t app .
docker tag app:latest 838596736137.dkr.ecr.us-east-1.amazonaws.com/app:latest

# Push Docker image to ECR
docker push 838596736137.dkr.ecr.us-east-1.amazonaws.com/app:latest

# Pull Docker image from ECR
docker pull ${ecrRepository}/${dockerImage}:${dockerTag}

# Stop and remove existing container (if any)
docker stop $containerName
docker rm $containerName

# Run container and map ports
docker run -d --name $containerName -p 80:3000 ${ecrRepository}/${dockerImage}:${dockerTag}
