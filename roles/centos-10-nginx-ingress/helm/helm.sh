helm fetch stable/nginx-ingress --version 1.40.3

helm install nginx-ingress-80   -n infra -f values.yaml.edit.80   stable/nginx-ingress --version 1.40.3
helm install nginx-ingress-8080 -n infra -f values.yaml.edit.8080 stable/nginx-ingress --version 1.40.3
