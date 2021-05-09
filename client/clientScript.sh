#!/usr/bin bash

# create new volume clientvol
docker volume create clientvol

# build docker image with no cache so that it doesn't fetches anything from previously build images.
# -t for tag name of image 
# -f for providing Dockerfile from custom location
# also buildcontext is for providing custom build context containing necessary files only.
docker build --no-cache -t capstone-docker-client:1.0 -f dockerfile/Dockerfile buildcontext/

# create conainer from previously created image
# -it for interactive terminal
# --net to provide custom network bridge
# -v to mount volume with the container
# --name to give container name
# In the end of command image is provided.
docker run -it --net customebridge -v clientvol:/clientdata --name clientcontainer capstone-docker-client:1.0

# IGNORE THESE CONTENTS
# -c "docker cp servercontainer:/serverdata clientcontainer:/clientdata"
#docker cp . clientcontainer:/clientdata

