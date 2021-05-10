# Source Code credit 
https://github.com/pratiklotia/Client-Server-Fast-File-Transfer-using-UDP-on-Python

# How ro run
first run serverScript from the terminal from it's location using command
**sh serverScript.sh**

Once server is up
Run the clientScript from the terminal again from it's location using command
**sh clientScript.sh**

Above two steps will do desired job.

<!-- What's inside script files -->
# Server

Build the Dockerfile to create new image using - 
**docker build --no-cache -t capstone-docker-server:1.0 -f dockerfile/Dockerfile buildcontext/
**

Run the image to create new image using -
**docker run -it --net customebridge --ip 172.16.0.22 -v servervol:/serverdata --name servercontainer capstone-docker-server:1.0
**
<!-- After this server will wait for Client -->

To enter into the container
**docker ps**
-- copy the <Container ID>
  
**docker exec -it <Container ID> bash
**
  
# Client

Build the Dockerfile to create new image using - 

**docker build --no-cache -t capstone-docker-client:1.0 -f dockerfile/Dockerfile buildcontext/
**

Run the image to create new image using -

**docker run -it --net customebridge -v clientvol:/clientdata --name clientcontainer capstone-docker-client:1.0
**

<!-- After this server will wait for Client -->

To enter into the container - open a new terminal -
**docker ps**

-- copy the <Container ID>
  
**docker exec -it <Container ID> bash
**
  
# Volume creation and mounting

**docker volume create servervol**
**docker volume create clientvol**

<!-- To mount -->
**docker run -it --net customebridge --ip 172.16.0.22 -v servervol:/serverdata --name servercontainer capstone-docker-server:1.0
**

**docker run -it --net customebridge -v clientvol:/clientdata --name clientcontainer capstone-docker-client:1.0
**
