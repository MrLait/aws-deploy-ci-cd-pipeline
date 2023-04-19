#!/bin/bash

# prune all images
sudo docker container stop $(sudo docker container ls -aq)
sudo docker container prune --force

# Get IDs of all images with name "my-app" and delete them
IMAGE_IDS=$(sudo docker images -q my-app)

# Loop through all image IDs and remove each one
for ID in $IMAGE_IDS
do
  sudo docker rmi $ID
done