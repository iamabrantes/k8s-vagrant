#!/bin/bash

apt-get update
apt-get upgrade -y
sudo > /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo curl -fsSL "https://packages.cloud.google.com/apt/doc/apt-key.gpg" | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/kubernetes-archive-keyring.gpg
sudo echo 'deb https://packages.cloud.google.com/apt kubernetes-xenial main' > /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -y
apt-get install kubeadm kubectl kubelet -y
apt-mark hold kubeadm kubectl kubelet
apt-get install docker.io -y