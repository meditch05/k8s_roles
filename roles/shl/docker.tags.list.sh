#!/bin/bash

# docker search centos
# curl -s https://registry.hub.docker.com/v2/repositories/library/centos/tags/ | jq '."results"[]["name"]'

curl -s https://registry.hub.docker.com/v2/repositories/library/$1/tags/ | jq '."results"[]["name"]'
