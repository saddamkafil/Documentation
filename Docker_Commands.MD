
1. how to search a docker image in hub.docker.com
```sh
docker search httpd
```
2. Download a docker image from hub.docker.com
```sh
docker image pull <image_name>:<image_version/tag>
```

3. List out docker images from your local system
```sh
docker image ls (or) docker images 
```

4. Create/run/start a docker container from image
```sh
docker run -d --name <container_Name> <image_name>:<image_version/tag>

d - run your container in back ground (detached)
```

5. Expose your application to host server
```sh
docker run -d  -p <host_port>:<container_port> --name <container_Name> <image_name>:<Image_version/tag>

docker run -d --name httpd_server -p 8080:80 httpd:2.2
```

6. List out running containers
```sh
docker ps
```

7. List out all docker container (running, stpooed, terminated, etc...)
```sh
docker ps -a
```

8. run a OS based container which interactive mode (nothing but login to container after it is up and running)

```sh
docker run -i -t --name centos_server centos:latest
i - interactive
t - Terminal
```

9. Stop a container 
```sh
docker stop <container_id>
```

10. Start a container which is in stopped or exit state

```sh
docker start <container_id>
```
11. Remove a container

```sh
docker rm <container_id>
```

12. login to a docker container
```sh
docker exec -it <container_Name> /bin/bash
```


### Docker tag and push image to repo
======================================
1. #### Create repo in dockerhub
2. #### Tag image locally 
```sh
docker tag local-image:tagname new-repo:tagname
```
#### example: docker tag amzlinux-tf:latest saddamkafil/amzlinux-tf:latest

3: #### Push to docker repo
```sh
docker push new-repo:tagname
```
#### Example: docker push saddamkafil/amzlinux-tf:latest 



| Command | Description |
| ------- | ----------- |
|``sudo docker ps -a pipe grep Exit pipe cut -d ' ' -f 1 pipe xargs sudo docker rm``| Removes all containers in exited state|
|`docker rmi $(docker images -f "dangling=true" -q)`| Removes all images with name none|
|`docker build -t imagename .`| To build a docker image |
|`docker build -t imagename -f Dockerfilename`| To Build a Docker image from Dockerfile wich is with Dockefilename|
|`docker run -itd -p 8080:8080 --name containername imagename:tag /bin/bash`| To run a docker container on port 8080|
|`docker cp <src-path> <container>:<dest-path> `| To copy a file from the local file system to a running container|
|`docker cp <container>:<src-path> <local-dest-path> `|To copy a file from the container to the local file system|
|`docker save -o /home/ubuntu/docker-image.tar dockerimage:tag`| Tar docker image on loacl system|
|`scp -r -i pemkey.pem docker-image.tar ubuntu@ip-address:/home/ubuntu/`| Copy tared docker image to another server|
|`docker load -i imagename.tar`| To load copied docker image from remote server to this server|
|`docker volume ls`| to list the volumes |
|`docker system df`| To list the docker system disk space format|
|`docker run -d -p 5000:5000 --restart=always --name registry registry:2` | start you local docker repo (works on windows k8 engine)|

4: #### delete all docker conatiners in exited state
```sh
sudo docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm
```
5: #### Delet all images with none name
```sh
docker rmi $(docker images -f "dangling=true" -q)
```
6:  #### Create docker image from different file name
```sh
docker build -t test-open-original -f Dockerfile3 .
```

7. Start jenkins as container with volume
```
docker run --restart=always -d -p 80:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home --name jenkins-2.319.2 jenkins/jenkins:lts
```
8. Start Nexus as container with volume
```
sudo docker run -d -p 8081:8081 --restart=always --name nexus -v /data/nexus-data:/nexus-data -p 8082:8082 sonatype/nexus3
```
