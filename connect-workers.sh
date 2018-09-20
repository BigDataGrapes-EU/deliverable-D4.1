# connect the workers to the master
docker ps | while read -r line ; do
	if [[ $line = *"spark-geo-worker"* ]]
	then
	   IFS=' ' read -r -a array <<< "$line"
	   echo "${array[0]}"
	   docker exec "${array[0]}" bash -c "cd / && bash worker.sh"
 	fi
done
