#!/bin/bash

helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator
helm fetch incubator/kafka   # 2019.07.23

helm install --name kafka --namespace kafka ./kafka
