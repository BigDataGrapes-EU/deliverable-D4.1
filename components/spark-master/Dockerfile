FROM gettyimages/spark
# MAINTAINER Vinicius Monteiro de Lira version: 0.1

# copy the xml setting for pydoop
COPY mapred-site.xml /etc/hadoop/

# conf spark
COPY spark-env.sh /usr/spark-2.3.1/conf/

# Install essential tools
RUN apt-get update && apt-get install -y python-setuptools python-dev build-essential
RUN apt-get install ssh procps nano wget git -y

# clone the project
RUN cd / && git clone https://github.com/geotrellis/geotrellis-landsat-tutorial.git
# RUN cd /geotrellis-landsat-tutorial/ && ./sbt compile
RUN cd /geotrellis-landsat-tutorial/data/landsat && ./download-data.sh

EXPOSE 8080
EXPOSE 7077
EXPOSE 6666
EXPOSE 4040