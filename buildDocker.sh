#!/bin/bash
docker build -t demo_computer_vision .

# sudo docker run --runtime nvidia -it --rm --gpus all --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 --network host --device /dev/video0 -e DISPLAY=:0 -v /tmp/.X11-unix:/tmp/.X11-unix demo_computer_vision