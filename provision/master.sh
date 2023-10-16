#!/bin/bash

sudo kubeadm init --apiserver-advertise-address=192.168.57.110 --control-plane-endpoint=192.168.57.110 --pod-network-cidr=10.244.0.0/16

mkdir $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://docs.tigera.io/archive/v3.25/manifests/calico.yaml

sudo kubeadm token create --print-join-command >> /vagrant/join.sh