#!/usr/bin/env bash

# create hdfs directories for input/output
hadoop fs -mkdir -p hdfs://namenode:8020/demos/ndvi_ndwi/input && hadoop fs -mkdir -p hdfs://namenode:8020/demos/ndvi_ndwi/output

# create hdfs directories
hadoop fs -copyFromLocal /geotrellis-landsat-tutorial/data/landsat hdfs://namenode:8020/demos/ndvi_ndwi/input

# create the mask bands
cd /geotrellis-landsat-tutorial/ && ./sbt "run-main tutorial.MaskBandsRandGandNIR"

# create the NDVI png
cd /geotrellis-landsat-tutorial/ && ./sbt "run-main tutorial.CreateNDVIPng"

# create the NDWI png
cd /geotrellis-landsat-tutorial/ && ./sbt "run-main tutorial.CreateNDWIPng"

# store on HDFS
hadoop fs -put /geotrellis-landsat-tutorial/data/ndvi.png hdfs://namenode:8020/demos/ndvi_ndwi/output/
hadoop fs -put /geotrellis-landsat-tutorial/data/ndwi.png hdfs://namenode:8020/demos/ndvi_ndwi/output/

# run the http server
cd /geotrellis-landsat-tutorial/data && python -m SimpleHTTPServer 8002 & 
