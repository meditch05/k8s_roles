#!/bin/bash

APISERVER=$(kubectl config view --minify | grep server | cut -f 2- -d ":" | tr -d " ")
SECRET_NAME=$(kubectl get secrets | grep ^default | cut -f1 -d ' ')
TOKEN=$(kubectl describe secret $SECRET_NAME | grep -E '^token' | cut -f2 -d':' | tr -d " ")

curl $APISERVER/api --header "Authorization: Bearer $TOKEN" --insecure



# APISERVER=$(kubectl config view --minify -o jsonpath='{.clusters[0].cluster.server}')
# SECRET_NAME=$(kubectl get serviceaccount default -o jsonpath='{.secrets[0].name}')
# TOKEN=$(kubectl get secret $SECRET_NAME -o jsonpath='{.data.token}' | base64 --decode)
#
# curl $APISERVER/api --header "Authorization: Bearer $TOKEN" --insecure
