# Use the official Python image as the base image
FROM nvidia/cuda:12.1.1-cudnn8-devel-ubuntu22.04

# Install software required for Python3
RUN apt update && apt install python3 python3-pip -y
# Install software required for OpenCV to work
RUN apt update && apt install ffmpeg libsm6 libxext6  -y
# Install networking tools
RUN apt update && apt install curl wget tar zip git net-tools inetutils-ping pciutils vim -y
# Install essential development tools
RUN apt install libssl-dev openssl make gcc -y
RUN apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev -y

