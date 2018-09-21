FROM gettyimages/spark
# MAINTAINER Vinicius Monteiro de Lira version: 0.1

# copy the xml setting for pydoop
COPY mapred-site.xml /etc/hadoop/

# conf spark
COPY spark-env.sh /usr/spark-2.3.1/conf/

# Install essential tools
RUN apt-get update && apt-get install -y python-setuptools python-dev build-essential
RUN apt-get install ssh procps nano wget git -y

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

# install sbt
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
RUN apt-get update
RUN apt-get install sbt

# clone the project. credits: https://github.com/geotrellis/geotrellis-landsat-tutorial
RUN cd / && git clone https://github.com/geotrellis/geotrellis-landsat-tutorial.git
RUN cd /geotrellis-landsat-tutorial/ && ./sbt compile
RUN cd /geotrellis-landsat-tutorial/data/landsat && ./download-data.sh

# clone the project. credits: https://github.com/azavea/geotrellis-collections-api-research
RUN cd / && git clone https://github.com/azavea/geotrellis-collections-api-research.git
RUN cd /geotrellis-collections-api-research && make download-tif
RUN cd /geotrellis-collections-api-research && make compile


EXPOSE 8080
EXPOSE 7077
EXPOSE 6666
EXPOSE 8001
EXPOSE 8002