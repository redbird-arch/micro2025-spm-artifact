#!/bin/bash

prepushmulticast_path=$(pwd)
docker run --security-opt seccomp=unconfined --privileged --network host --detach -i --mount type=bind,src=${prepushmulticast_path},dst=/AE-Folder --workdir=/AE-Folder --name=PrepushMulticast-Docker --cap-add=ALL ae-docker-image
docker exec -it PrepushMulticast-Docker /bin/bash