#!/bin/sh
# ---------------------------------------------------------
#   Accordion v1.0             http://www.mantech.co.kr/
#
#   Copyright(C) 2017, Mantech, All Rights Reserved.
# ---------------------------------------------------------

while [ -z $prompt ];
  do read -p "Are you sure you want to delete? [y/n] : " choice;
  case "$choice" in
    y|Y ) prompt=true; break;;
    n|N ) exit 0;;
  esac;
done;

ansible-playbook -i hosts kube-teardown.yml
