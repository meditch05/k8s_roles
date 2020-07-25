#!/bin/bash

kubectl -n kafka exec testclient -- kafka-topics --zookeeper kafka-zookeeper:2181 --topic test --create --partitions 1 --replication-factor 3
kubectl -n kafka exec testclient -- kafka-topics --zookeeper kafka-zookeeper:2181 --topic test --describe
