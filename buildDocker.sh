#!/bin/bash
docker build -t demo_computer_vision .

# relevant info from
# https://www.cloudsavvyit.com/10520/how-to-run-gui-applications-in-a-docker-container/
# and
# https://catalog.ngc.nvidia.com/orgs/nvidia/containers/tensorflow

# sudo docker run --runtime nvidia -it --rm --gpus all --ipc=host --shm-size=1g --ulimit memlock=-1 --ulimit stack=67108864 --network host --device /dev/video0 -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix demo_computer_vision

# don't forget to supervise gpu load
# watch -n 2 nvidia-smi