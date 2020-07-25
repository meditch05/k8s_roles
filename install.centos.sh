#!/bin/sh
# ---------------------------------------------------------
#   Accordion v1.0             http://www.mantech.co.kr/
#
#   Copyright(C) 2017, Mantech, All Rights Reserved.
# ---------------------------------------------------------

if which ansible-playbook >/dev/null; then
    ansible-playbook -i hosts all.centos.yml
else
    echo 'Error: ansible is not installed.' >&2
    exit 1
fi
