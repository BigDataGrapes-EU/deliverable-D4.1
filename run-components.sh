#!/bin/bash
docker-compose up -d

# connect the workers to the master
bash connect-workers.sh

my_ip=`ip route get 1|awk '{print $NF;exit}'`
echo "Namenode: http://${my_ip}:50070"
echo "Spark-master: http://${my_ip}:8080"
echo "Hue (HDFS Filebrowser): http://${my_ip}:8088/home"