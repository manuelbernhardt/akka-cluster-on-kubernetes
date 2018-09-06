#!/bin/bash
echo "Creating partition kube-master, kube-node1 | kube-node-2"
docker exec kube-master /bin/sh -c 'iptables -A INPUT -s $(getent hosts kube-node-2 | cut -d " " -f1) -j DROP'
docker exec kube-node-1 /bin/sh -c 'iptables -A INPUT -s $(getent hosts kube-node-2 | cut -d " " -f1) -j DROP'
docker exec kube-node-2 /bin/sh -c 'iptables -A INPUT -s $(getent hosts kube-node-1 | cut -d " " -f1) -j DROP'
docker exec kube-node-2 /bin/sh -c 'iptables -A INPUT -s $(getent hosts kube-master | cut -d " " -f1) -j DROP'
