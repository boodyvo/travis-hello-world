#!/bin/bash

printf 'export GOVERSION=1.7.1\n' >> ~/.bashrc
printf 'export GOPATH=$HOME/golang-source\n' >> ~/.bashrc
printf 'export PATH=$PATH:/usr/local/go/bin\n' >> ~/.bashrc
printf 'export PATH=$PATH:$GOPATH/bin\n' >> ~/.bashrc
source ~/.bashrc
echo $GOVERSION
echo $PATH
export GOVERSION=1.7.1
export GOPATH=$HOME/golang-source
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
echo $GOVERSION
echo $PATH
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