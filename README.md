# H2020 RIA BigDataGrapes - Methods and Tools for Scalable Distributed Processing (T4.1)

The deliverable D4.1 (Methods and Tools for Scalable Distributed Processing) describes the main mechanisms and tools used in the BigDataGrapes (BDG) platform to support efficient processing of large datasets in the context of grapevine-related assets. The BDG software stack designed provides efficient and fault-tolerant tools for distributed processing, aiming at providing scalability and reliability for the applications.

The deliverable introduces the big picture of the architecture of the BDG platform and the main technologies currently used in the Persistence and Processing Layers of the platform to perform efficient data processing over extremely large dataset.
Then the requirements needed to run the BigDataGrapes platform are introduced and discussed, by also providing instructions to set up and to launch the platform. The platform has been built, re-using and customizing the software stack of the Big Data Europe (BDE, https://www.big-data-europe.eu/). Besides the customization of some existing components, the BigDataGrapes software stack extends the BDE to better support efficient processing and distributed predictive analytics of geospatial raster data in the context of precision agriculture and Farm Management Systems. Furthermore, all the platform components have been designed and built using Docker containers. They thus include everything needed to deploy the BDG platform with a guaranteed behavior on any suitable system that can run a Docker engine. 

Finally, we report about two demos that have been already developed on the top of it by the project’s partner. Specifically, the two demonstrators perform scalable operations on geospatial raster data using the Spark-based GeoTrellis geographic data processing engine provided by the BDG platform. The first demo regards the tiling of large raster satellite images. Tiling is a mandatory process that allows the large raster datasets to be split-up into manageable pieces that can be processed on parallel and distributed resources. As a second demonstrator, we process geotiff images to extract two relevant indexes. The first index is the normalized difference vegetation index (NDVI), a graphical indicator that assess at what degree the target being observed contains live green vegetation or not. The second index is instead the Normalized Difference Water Index (NDWI), most appropriate for water body mapping.


## BigDataGrapes Methods and Tools for Scalable Distributed Processing Demonstrators

To get the code demonstrating the Methods and Tools for Scalable Distributed Processing of BDG, clone this GitHub repository

```
$ git clone https://github.com/BigDataGrapes-EU/deliverable-D4.1.git
```

The repository contains three Jupyter Notebooks and a Bash shell script that should be used to initialize the Big Data Grapes Platform. The script should be executed by running the Bash command below:

```
$ ./run-components.sh
```

The Bash script above downloads the Docker images and builds the environment according to the predefined configuration settings. The Bash script also starts the Docker containers of the BigDataGrapes software stack components.


For this deliverable, we have made available two demonstrators performing common operations on raster data using the BigDataGrapes platform:
* Tiling Very Large Geospatial Rasters; 
(Credits: https://github.com/azavea/geotrellis-collections-api-research)
* Raster NVDI/NDWI layers computation; 
(Credits: https://github.com/geotrellis/geotrellis-landsat-tutorial)

### Tiling Very Large Geospatial Rasters

For this first demonstrator, the images are retrieved from HDFS component from the following directory. 

```
$ hadoop fs –ls /demos/raster_tiling/input
```

In order to generate pyramided tiles, we need to resample the source image at different sizes, and then cut the resulting image into tiles.

To execute this demo, run the following bash command:  

```
$ ./run-tiling_pyramid.sh
```

The PNG of the processed tiles for the different zoom levels can be accessed through a web browser using the port 8001 (http://<server_address>:8001) or in the following HDFS directory.

```
$ hadoop fs –ls /demos/ndvi_ndwi/output
```

### Raster NVDI/NDWI Layers computation

The input images are retrieved from HDFS component from the following directory.

```
$ hadoop fs –ls /demos/ndvi_ndwi/input
```

To execute this demo, run the following bash command: 

```
$ ./run-ndvi_ndwi_computation.sh
```

Both the NDVI and the NDWI PNG images can be accessed through a web browser using the port 8002 (http://<server_address>:8002). 

The images can also be accessed through the HDFS in the following directory:

```
$ hadoop fs –ls /demos/ndvi_ndwi/output
```




