#!/usr/bin/env bash

# create the input and output directories into HDFS
hadoop fs -mkdir -p hdfs://namenode:8020/demos/raster_tiling/input && hadoop fs -mkdir -p hdfs://namenode:8020/demos/raster_tiling/output

# create hdfs directories
hadoop fs -copyFromLocal /geotrellis-collections-api-research/ingest/land-cover-data/geotiff hdfs://namenode:8020/demos/raster_tiling/input

# ingest the image into spark
cd /geotrellis-collections-api-research && make ingest

# save the png tiles
cd /geotrellis-collections-api-research && make paint

# create hdfs directories
hadoop fs -copyFromLocal /geotrellis-collections-api-research/ingest/land-cover-data/tiles hdfs://namenode:8020/demos/raster_tiling/output

# run the http server
cd /geotrellis-collections-api-research/ingest/land-cover-data/ && python -m SimpleHTTPServer 8002 & 