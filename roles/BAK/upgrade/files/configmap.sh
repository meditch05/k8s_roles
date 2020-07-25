#!/bin/bash

################ 1.2.0.7 -> 1.3.0.1 ##########################
configmap_path=/etc/kubernetes/addon/accordion/configmaps
ns_count=$(kubectl get namespace | grep -Ev "accordion|default|kube-public|kube-system|monitoring|jenkins" | sed 1d | awk '{print $1}' | wc -l)
namespaces=(`kubectl get namespace | grep -Ev "accordion|default|kube-public|kube-system|monitoring|jenkins" | sed 1d | awk '{print $1}'`)
for ((i=0;i<$ns_count;i++)); do
   namespace=${namespaces[i]}
   mkdir $configmap_path/$namespace
   cat $configmap_path/accesslog-template.yaml | sed "s|{{ nameSpcae }}|$namespace|g" > $configmap_path/$namespace/accesslog-tempate.yaml
   cat $configmap_path/tomcat-fluentd-config.yaml | sed "s|{{ nameSpcae }}|$namespace|g" > $configmap_path/$namespace/tomcat-fluentd-config.yaml
   cat $configmap_path/wildfly-fluentd-config.yaml | sed "s|{{ nameSpcae }}|$namespace|g" > $configmap_path/$namespace/wildfly-fluentd-config.yaml
   kubectl apply -f $configmap_path/$namespace
done

mount_path='{"mountPath": "/template", "name": "fluentd-template"}'
configMap='{"configMap": {"defaultMode": 420, "name": "accesslog-template"}, "name": "fluentd-template"}'

#tomcat
kubectl get deployment --all-namespaces -o json | jq '.items[] | select(.spec.template.spec.containers[].name=="tomcat")' | jq --argjson mount_path "$mount_path" '.spec.template.spec.containers[1].volumeMounts[3] = $mount_path' | jq --argjson configMap "$configMap" '.spec.template.spec.volumes[7] = $configMap' | jq '.spec.template.spec.containers[1].image = "gcr.io/google-containers/fluentd-elasticsearch:v2.4.0"' | kubectl apply -f -

#wildfly
kubectl get deployment --all-namespaces -o json | jq '.items[] | select(.spec.template.spec.containers[].name=="wildfly")' | jq --argjson mount_path "$mount_path" '.spec.template.spec.containers[1].volumeMounts[3] = $mount_path' | jq --argjson configMap "$configMap" '.spec.template.spec.volumes[7] = $configMap' | jq '.spec.template.spec.containers[1].image = "gcr.io/google-containers/fluentd-elasticsearch:v2.4.0"' | kubectl apply -f -
###############################################################
