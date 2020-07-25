#!/bin/sh
# ---------------------------------------------------------
#   Accordion v1.0             http://www.mantech.co.kr/
#
#   Copyright(C) 2017, Mantech, All Rights Reserved.
# ---------------------------------------------------------

if [ $# -eq 0 ]
  then
    echo "Usage: removenode.sh [hostname]"
    exit 1
fi

kubectl drain $1
ansible-playbook -i hosts run_role.yml -e "ROLE=21-remove-node" -e "TARGET=$1"
kubectl delete node $1
