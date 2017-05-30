#!/bin/bash

wget https://storage.googleapis.com/golang/go${GOVERSION}.linux-amd64.tar.gz && \
tar -C /usr/local -xzf go${GOVERSION}.linux-amd64.tar.gz&& \
rm go${GOVERSION}.linux-amd64.tar.gz

apt-get --yes install git

go get -u github.com/Masterminds/glide

wget https://github.com/google/protobuf/releases/download/v3.0.2/protoc-3.0.2-linux-x86_64.zip
unzip protoc-3.0.2-linux-x86_64.zip -d /usr/local
rm protoc-3.0.2-linux-x86_64.zip

go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
go get -u github.com/golang/protobuf/protoc-gen-go

git clone https://github.com/BitfuryLightning/lnd-simnet-env $GOPATH/src/github.com/BitfuryLightning/lnd-simnet-env
cd $GOPATH/src/github.com/BitfuryLightning/lnd-simnet-env
git checkout -b python-grpc-client
git pull origin python-grpc-client
glide install
./build.sh

mkdir -p $SHAREDVOLUME

apt-get install --yes docker.io

cd $SIMNETDATA/docker
./build_all_images.sh

apt-get install --yes python3-pip
pip3 install virtualenv virtualenvwrapper
printf 'export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3\n' >> ~/.bashrc
printf 'source /usr/local/bin/virtualenvwrapper.sh\n' >> ~/.bashrc
source ~/.bashrc
mkvirtualenv docker-compose
pip install docker-compose

workon docker-compose
cd $SIMNETDATA
lnd-simnt-env &
