#!/bin/bash

# pune all images
cd /home/ubuntu/src/
sudo docker load --input my-app-docker.tar.gz 
sudo docker run -d -p 80:80 my-app