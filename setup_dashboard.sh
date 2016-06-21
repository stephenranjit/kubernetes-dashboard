#!/bin/bash -e

# check if current server is the master
ps -eaf | grep kube-apiserver | grep -v grep
r=$?
if [ $r == 0 ]; then
    echo "running on master"
else
    echo "not running on master"
    exit 1
fi

# check if master is a kubelet
ps -eaf | grep kubelet | grep -v grep
r=$?
if [ $r == 0 ]; then
    echo "kubelet configured"
else
    echo "no kubelet found"
fi

# setup kubelet on the master
echo "please setup kubelet manually in order to use kubernetes-dashboard"

# setup namespace

if kubectl create -f https://raw.githubusercontent.com/stephenranjit/kubernetes-dashboard/master/kube-system.yaml; then
	echo "something went wrong while installing the namespace kube-system"
else
	echo "successfully installed namespace kube-system"
fi

# install kubernetes-dashboard

if kubectl create -f https://raw.githubusercontent.com/stephenranjit/kubernetes-dashboard/master/kubernetes-dashboard.yaml; then
	echo "something went wrong while installing the kube-dashboard"
else
	echo "successfully installed namespace kube-dashboard"
fi