#!/bin/bash
sbt docker:publishLocal
docker save trip:1.0.0 | docker exec -i kube-master docker load
docker save trip:1.0.0 | docker exec -i kube-node-1 docker load
docker save trip:1.0.0 | docker exec -i kube-node-2 docker load
kubectl delete -f .deployment/trip.yml
kubectl create -f .deployment/trip.yml
