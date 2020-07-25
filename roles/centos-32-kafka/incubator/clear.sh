#!/bin/bash

kubectl delete -n kafka persistentvolumeclaim/datadir-kafka-0 
kubectl delete -n kafka persistentvolumeclaim/datadir-kafka-1
kubectl delete -n kafka persistentvolumeclaim/datadir-kafka-2
