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