#!/bin/bash

# export SPARK_MASTER=spark://spark-master:7077
# export SPARK_MASTER_HOST=spark-master
# bash cp /spark-env.sh /usr/spark-2.3.1/conf/

bash /usr/spark-2.3.1/sbin/stop-all.sh && bash /usr/spark-2.3.1/sbin/stop-slave.sh && bash /usr/spark-2.3.1/sbin/start-slave.sh spark://spark-master:7077
