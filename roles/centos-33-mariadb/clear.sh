#!/bin/bash

kubectl delete -n p065336 persistentvolumeclaim/data-mariadb-master-0 
kubectl delete -n p065336 persistentvolumeclaim/data-mariadb-slave-0  
