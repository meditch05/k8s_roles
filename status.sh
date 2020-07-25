#!/bin/sh
# ---------------------------------------------------------
#   Accordion v1.0             http://www.mantech.co.kr/
#
#   Copyright(C) 2017, Mantech, All Rights Reserved.
# ---------------------------------------------------------

echo "========================================"
echo " nodes "
echo "========================================"
kubectl get nodes

echo "========================================"
echo " deployments/po/svc "
echo "========================================"
kubectl get deployments,po,svc --all-namespaces
