# FROM bde2020/spark-worker:2.1.0-hadoop2.8-hive-java8
FROM gettyimages/spark

# COPY spark-env.sh /
COPY worker.sh /

# install essential tools
RUN apt-get update && apt-get install -y python-setuptools python-dev build-essential
RUN apt-get install ssh procps nano wget git -y

# clone the project
RUN cd / && git clone https://github.com/geotrellis/geotrellis-landsat-tutorial.git
RUN cd /geotrellis-landsat-tutorial/ && ./sbt compile

# ENTRYPOINT ["bash", "/worker.sh"]
EXPOSE 8081
