FROM nvcr.io/nvidia/tensorflow:22.01-tf2-py3

ENV LANG C.UTF-8

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    git wget curl tar python3-opencv vim libhdf5-dev && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /faceswap && git clone --depth 1 https://github.com/deepfakes/faceswap.git /faceswap

RUN mkdir /demo_computer_vision
RUN mkdir /demo_computer_vision/models

COPY ./models /demo_computer_vision/models
COPY ./requirements.txt /demo_computer_vision
COPY ./yolo.py /demo_computer_vision

RUN cd /demo_computer_vision && pip install -r requirements.txt

RUN apt update && apt install libx11-xcb1

WORKDIR /demo_computer_vision/

