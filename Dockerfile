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

RUN cd /demo_computer_vision && pip install --upgrade --upgrade-strategy only-if-needed -r requirements.txt

WORKDIR /demo_computer_vision/

