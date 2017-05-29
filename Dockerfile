FROM ubuntu:16.04

RUN apt-get update && \
 apt-get install -y python3 python3-pip git libpq-dev python3-dev

RUN pip3 install --upgrade pip