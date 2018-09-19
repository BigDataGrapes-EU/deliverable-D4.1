# FROM bde2020/spark-worker:2.1.0-hadoop2.8-hive-java8
FROM gettyimages/spark

# install python essencials
RUN apt-get update && apt-get install -y python-setuptools python-dev build-essential

# install essential tools
RUN apt-get install wget -y && apt-get install git -y

# clone the project
RUN cd / && git clone https://github.com/geotrellis/geotrellis-landsat-tutorial.git

# path spark
# ENV PATH=$PATH:/spark/bin

# NVDI/NWDI demo
RUN cd /geotrellis-landsat-tutorial/data/landsat && ./download-data.sh
RUN cd /geotrellis-landsat-tutorial/ && ./sbt compile


# RUN wget http://apt.typesafe.com/repo-deb-build-0002.deb
# RUN dpkg -i repo-deb-build-0002.deb
# RUN apt-get update
# RUN apt-get install sbt


# https://websiteforstudents.com/install-the-latest-node-js-and-nmp-packages-on-ubuntu-16-04-18-04-lts/
