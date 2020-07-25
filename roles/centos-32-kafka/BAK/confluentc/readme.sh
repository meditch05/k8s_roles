root@SKT-ELKPAP01:/root/k8s/roles/centos-32-kafka/confluentc # helm fetch confluentc/cp-helm-charts
root@SKT-ELKPAP01:/root/k8s/roles/centos-32-kafka/confluentc # vi cp-helm-charts/values.yaml 
root@SKT-ELKPAP01:/root/k8s/roles/centos-32-kafka/confluentc # helm install --name kafka --namespace kafka ./cp-helm-charts
