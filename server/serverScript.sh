#!/usr/bin bash
# create custom bridge network with subnet IP(so that it doesn't changes every time when container is up) and network name
docker network create --subnet=172.16.0.0/16 customebridge

# create new volume
docker volume create servervol

# build docker image with no cache so that it doesn't fetches anything from previously build images.
# -t for tag name of image 
# -f for providing Dockerfile from custom location
# also buildcontext is for providing custom build context containing necessary files only.
docker build --no-cache -t capstone-docker-server:1.0 -f dockerfile/Dockerfile buildcontext/

# create conainer from previously created image
# -it for interactive terminal
# --net to provide custom network bridge
# --ip specify the IP address assigned to the container on that network
# -v to mount volume with the container
# --name to give container name
# In the end of command image is provided.
docker run -it --net customebridge --ip 172.16.0.22 -v servervol:/serverdata --name servercontainer capstone-docker-server:1.0

# IGNORE THESE CONTENTS
#docker cp servercontainer:/serverdata/random.txt . 
#cat echo "Welcome" > samplefile.txt
#docker cp servercontainer:/serverdata clientcontainer:/clientdata