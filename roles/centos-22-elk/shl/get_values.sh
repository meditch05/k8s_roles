#!/bin/bash

helm repo add elastic https://helm.elastic.co

helm inspect values elastic/elasticsearch > values.yaml.elasticsearch.ori  # ver 7.1.0
helm inspect values elastic/kibana        > values.yaml.kibana.ori         # ver 7.1.0
helm inspect values elastic/filebeat      > values.yaml.filebeat.ori       # ver 7.1.0

# helm fetch elastic/filebeat

# helm inspect values elastic/elasticsearch --version 7.0.1-alpha1 > values.yaml.elasticsearch.ori  # ver 7.0.1
# helm inspect values elastic/kibana        --version 7.0.1-alpha1 > values.yaml.kibana.ori         # ver 7.0.1
# helm inspect values stable/logstash > values.yaml.logstash.ori  # ver 6.7.0

# helm inspect values stable/filebeat > values.yaml.filebeat.ori  # ver 6.7.0 - Don't Used ( output.file is fixed in chart.yaml.  output.logstash can't using )
