#!/bin/bash

# pune all images
sudo docker container stop $(sudo docker container ls -aq)
sudo docker container prune --force