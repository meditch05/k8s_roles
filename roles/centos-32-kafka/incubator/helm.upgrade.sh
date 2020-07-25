#/bin/bash

# helm upgrade -f ./values.yaml.edit.enable.prometheus kafka --namespace kafka incubator/kafka

_print() {
echo Release "kafka" has been upgraded.
echo LAST DEPLOYED: Mon Sep  2 16:35:46 2019
echo NAMESPACE: kafka
echo STATUS: DEPLOYED
echo 
echo RESOURCES:
echo "==> v1/ConfigMap"
echo NAME             DATA  AGE
echo kafka-metrics    1     0s
echo kafka-zookeeper  3     0s
echo 
echo "==> v1/Pod(related)"
echo NAME               READY  STATUS       RESTARTS  AGE
echo kafka-0            1/1    Running      6         40d
echo kafka-1            1/1    Running      3         31d
echo kafka-2            1/1    Running      5         40d
echo kafka-zookeeper-0  1/1    Running      1         31d
echo kafka-zookeeper-1  1/1    Running      3         40d
echo kafka-zookeeper-2  1/1    Terminating  2         40d
echo 
echo "==> v1/Service"
echo NAME                      TYPE       CLUSTER-IP      EXTERNAL-IP  PORT(S)                     AGE
echo kafka                     ClusterIP  10.97.143.49    <none>       9092/TCP                    40d
echo kafka-0-external          NodePort   10.106.249.173  <none>       19092:31090/TCP             40d
echo kafka-1-external          NodePort   10.96.103.43    <none>       19092:31091/TCP             40d
echo kafka-2-external          NodePort   10.111.42.34    <none>       19092:31092/TCP             40d
echo kafka-headless            ClusterIP  None            <none>       9092/TCP                    40d
echo kafka-zookeeper           ClusterIP  10.109.192.127  <none>       2181/TCP                    40d
echo kafka-zookeeper-headless  ClusterIP  None            <none>       2181/TCP,3888/TCP,2888/TCP  40d
echo 
echo "==> v1beta1/PodDisruptionBudget"
echo NAME             MIN AVAILABLE  MAX UNAVAILABLE  ALLOWED DISRUPTIONS  AGE
echo kafka-zookeeper  N/A            1                0                    40d
echo 
echo "==> v1beta1/StatefulSet"
echo NAME             READY  AGE
echo kafka            3/3    40d
echo kafka-zookeeper  3/3    40d
echo 
echo 
echo NOTES:
echo ### Connecting to Kafka from inside Kubernetes
echo 
echo You can connect to Kafka by running a simple pod in the K8s cluster like this with a configuration like this:
echo 
echo   apiVersion: v1
echo   kind: Pod
echo   metadata:
echo     name: testclient
echo     namespace: kafka
echo   spec:
echo     containers:
echo     - name: kafka
echo       image: confluentinc/cp-kafka:5.0.1
echo       command:
echo         - sh
echo         - -c
echo         - "exec tail -f /dev/null"
echo 
echo Once you have the testclient pod above running, you can list all kafka
echo topics with:
echo 
echo   kubectl -n kafka exec testclient -- kafka-topics --zookeeper kafka-zookeeper:2181 --list
echo 
echo To create a new topic:
echo 
echo   kubectl -n kafka exec testclient -- kafka-topics --zookeeper kafka-zookeeper:2181 --topic test1 --create --partitions 1 --replication-factor 1
echo 
echo To listen for messages on a topic:
echo 
echo   kubectl -n kafka exec -ti testclient -- kafka-console-consumer --bootstrap-server kafka:9092 --topic test1 --from-beginning
echo 
echo To stop the listener session above press: Ctrl+C
echo 
echo To start an interactive message producer session:
echo   kubectl -n kafka exec -ti testclient -- kafka-console-producer --broker-list kafka-headless:9092 --topic test1
echo 
echo To create a message in the above session, simply type the message and press "enter"
echo To end the producer session try: Ctrl+C
echo 
echo If you specify "zookeeper.connect" in configurationOverrides, please replace "kafka-zookeeper:2181" with the value of "zookeeper.connect", or you will get error.
echo 
echo 
echo ### Connecting to Kafka from outside Kubernetes
echo 
echo You have enabled the external access feature of this chart.
echo 
echo **WARNING:** By default this feature allows Kafka clients outside Kubernetes to
echo connect to Kafka via NodePort(s) in `PLAINTEXT`.
echo 
echo Please see this chart's README.md for more details and guidance.
echo 
echo If you wish to connect to Kafka from outside please configure your external Kafka
echo clients to point at the following brokers. Please allow a few minutes for all
echo associated resources to become healthy.
echo   
echo   kafka.cluster.local:31090
echo   kafka.cluster.local:31091
echo   kafka.cluster.local:31092
echo 
echo 
echo To view JMX configuration (pull request/updates to improve defaults are encouraged):
echo   
echo   kubectl -n kafka describe configmap kafka-metrics
}

print
