#!/bin/bash

# 2019.07.24

helm install --name mariadb --namespace p065336 -f ./values.yaml.edit stable/mariadb
