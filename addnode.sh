#!/bin/sh
# ---------------------------------------------------------
#   Accordion v1.0             http://www.mantech.co.kr/
#
#   Copyright(C) 2017, Mantech, All Rights Reserved.
# ---------------------------------------------------------

if [ $# -eq 0 ]
  then
    echo "Usage: addnode.sh [hostname]"
    exit 1
fi

ansible-playbook -i hosts node.yml -e "TARGET=$1"
