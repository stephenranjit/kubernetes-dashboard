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

# setup namespace


# install kubernetes-dashboard