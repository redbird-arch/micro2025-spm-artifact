#!/bin/bash

spm_path=$(pwd)
docker run --security-opt seccomp=unconfined --privileged --network host --detach -i --mount type=bind,src=${spm_path},dst=/AE-Folder --workdir=/AE-Folder --name=SPM-Docker --cap-add=ALL ae-docker-image
docker exec -it SPM-Docker /bin/bash