#!/usr/bin/env bash

# Load Kibana Dashboard
cd beats-dashboards-*
curl http://localhost:9200
./load.sh

#Load filebeat index template in elasticsearch
cd ~ && curl -O https://gist.githubusercontent.#com/thisismitch/3429023e8438cc25b86c/raw/d8c479e2a1adcea8b1fe86570e42abab0f10f364/filebeat-index-template.json
curl -XPUT 'http://localhost:9200/_template/filebeat?pretty' -d@filebeat-index-template.json

#Copy SSL certficates to client
#apt-get install -y ssh && apt-get install -y sshpass
#sshpass -p 'vagrant' scp -o StrictHostKeyChecking=no /etc/pki/tls/certs/logstash-forwarder.crt vagrant@10.0.#15.73:/tmp ## hardcoded client server IP and user and password
#scp /etc/pki/tls/certs/logstash-forwarder.crt vagrant@10.0.15.73:/tmp ## hardcoded client server IP and user #and password
