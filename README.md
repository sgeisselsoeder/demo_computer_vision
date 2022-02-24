# Demo Computer Vision

# Preparation
for ubuntu 20.04

### Docker
from https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html

curl https://get.docker.com | sh && sudo systemctl --now enable docker

### Nvidia Docker with GPUs
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update && sudo apt-get install -y nvidia-docker2

sudo systemctl restart docker

### Get model
python initialize.py

### Build image
sudo docker build -t demo_computer_vision .

# Run container
sudo docker run --runtime nvidia -it --rm --gpus all --ipc=host --shm-size=1g --ulimit memlock=-1 --ulimit stack=67108864 --network host --device /dev/video0 -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix demo_computer_vision

relevant info from
https://www.cloudsavvyit.com/10520/how-to-run-gui-applications-in-a-docker-container/
and
https://catalog.ngc.nvidia.com/orgs/nvidia/containers/tensorflow

### Inside the container:
python yolo.py

### Optionally on the host:
supervise gpu load on the host:

watch -n 2 nvidia-smi