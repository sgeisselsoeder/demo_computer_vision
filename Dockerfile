FROM nvcr.io/nvidia/tensorflow:22.01-tf2-py3

ENV LANG C.UTF-8

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    git wget curl tar python3-opencv vim libhdf5-dev && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /demo_computer_vision
RUN mkdir /demo_computer_vision/models

COPY ./models /demo_computer_vision/models
COPY ./requirements.txt /demo_computer_vision
COPY ./yolo.py /demo_computer_vision

RUN pip install --upgrade pip
RUN pip install wheel
RUN pip install imageai
RUN cd /demo_computer_vision && pip install -r requirements.txt

# # RUN pip install torch==1.4 torchvision>=0.5 imageio scikit-image pyautogui
# RUN apt-get update && apt-get install python3-tk -y
# RUN pip install opencv-python tqdm pillow scikit-learn fastcluster imageio imageio-ffmpeg ffmpy nvidia-ml-py pynvx
# RUN pip install tensorflow-gpu

WORKDIR /demo_computer_vision/

