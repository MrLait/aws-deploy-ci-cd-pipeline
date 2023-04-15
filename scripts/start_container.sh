export AWS_ACCOUNT_ID=749559872087
export AWS_REGION=us-east-1
export IMAGE_NAME=codedeploy_solution
export IMAGE_TAG=my-app
export HOST_PORT=5020
export CONTAINER_PORT=5020

#!/bin/bash
sudo yum -y update
sudo yum -y install docker
sudo service docker start
sudo docker login -u AWS -p $(aws ecr get-login-password --region $AWS_REGION) $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
sudo docker pull $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$IMAGE_NAME:$IMAGE_TAG
sudo docker run -d -p $HOST_PORT:$CONTAINER_PORT $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$IMAGE_NAME:$IMAGE_TAG
