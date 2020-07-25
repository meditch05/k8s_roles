#!/bin/bash

kubectl delete -n kafka persistentvolumeclaim/datadir-0-kafka-cp-kafka-0     
kubectl delete -n kafka persistentvolumeclaim/datadir-0-kafka-cp-kafka-1     
kubectl delete -n kafka persistentvolumeclaim/datadir-0-kafka-cp-kafka-2     
kubectl delete -n kafka persistentvolumeclaim/datadir-kafka-cp-zookeeper-0   
kubectl delete -n kafka persistentvolumeclaim/datadir-kafka-cp-zookeeper-1   
kubectl delete -n kafka persistentvolumeclaim/datadir-kafka-cp-zookeeper-2   
kubectl delete -n kafka persistentvolumeclaim/datalogdir-kafka-cp-zookeeper-0
kubectl delete -n kafka persistentvolumeclaim/datalogdir-kafka-cp-zookeeper-1
kubectl delete -n kafka persistentvolumeclaim/datalogdir-kafka-cp-zookeeper-2
