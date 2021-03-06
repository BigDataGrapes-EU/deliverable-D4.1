#!/usr/bin/env bash


# create hdfs directories
echo "creating hdfs directories raster_tiling input and output"
hadoop fs -mkdir -p hdfs://namenode:8020/demos/raster_tiling/input && hadoop fs -mkdir -p hdfs://namenode:8020/demos/raster_tiling/output

# create the input and output directories into HDFS
echo "upload the geotiff image to hdfs input diretory"
hadoop fs -copyFromLocal /geotrellis-collections-api-research/ingest/land-cover-data/geotiff hdfs://namenode:8020/demos/raster_tiling/input

# echo "ingesting qinput geotiff into spark"
# ingest the image into spark
# cd /geotrellis-collections-api-research && make ingest

# save the png tiles
echo "first execution requires to compile the whole project..."
cd /geotrellis-collections-api-research && make paint

# create hdfs directories
echo "uploading the geotiff tiles to hdfs output directory"
hadoop fs -copyFromLocal /geotrellis-collections-api-research/ingest/land-cover-data/tiles hdfs://namenode:8020/demos/raster_tiling/output

echo "tiling process output: http://<server>:50070/explorer.html#/demos/raster_tiling/output"
# echo "running http server at port:8002"

# run the http server
cd /geotrellis-collections-api-research/ingest/land-cover-data/ && python -m SimpleHTTPServer 8002 & 
