#!/bin/bash
if [ $# -lt 1 ]; then
    echo "*** ERROR: need argument like spark-geo-worker=3"
    echo "Usage: ${0:-basename} <N>"
    echo "where <N>: number of spark-workers"
    echo "e.g."
    echo "   ${0:-basename} 3"
    exit 1
fi

# scale out
docker-compose scale spark-geo-worker=$1

# connect to the master
bash connect-workers.sh